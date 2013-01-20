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

# my-app deployen
application "my-app" do
  path "/usr/local/my-app"
  repository "http://33.33.13.10/myapp-1.0.war"
  revision "1.0"

  java_webapp do
    database do
      driver 'org.postgresql.Driver'
      adapter 'postgresql'
      database node['myapp']['db']['dbname']
      host node['myapp']['web']['db_host']
      port 5432
      username node['myapp']['db']['username']
      password node['myapp']['db']['password']
    end
  end

  tomcat
end



