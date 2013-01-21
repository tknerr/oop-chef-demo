#
# Cookbook Name:: myapp
# Recipe:: web
#
# Copyright 2012, Zühlke Engineering GmbH
#
# All rights reserved - Do Not Redistribute
#

# erstmal ein `apt-get update`
include_recipe "apt"

# dann Tomcat installieren
include_recipe "tomcat"

db_host = node['myapp']['web']['db_host']
db_name = node['myapp']['db']['dbname']
db_user = node['myapp']['db']['username']
db_pass = node['myapp']['db']['password']

# my-app deployen
application "my-app" do
  path "/usr/local/my-app"
  owner node["tomcat"]["user"]
  group node["tomcat"]["group"]

  # wir nehmen das Yabe Beispiel vom Play! Framework:
  # http://www.playframework.org/documentation/1.0/samples
  repository "http://dl.dropbox.com/u/13494216/yabe.war"
  revision "1.0"
  strategy :java_remote_file

  java_webapp do
    database do
      driver 'org.postgresql.Driver'
      adapter 'postgresql'
      database db_name
      host db_host
      port 5432
      username db_user
      password db_pass
      max_active 1
      max_idle 2
      max_wait 3
    end
  end

  tomcat
end

