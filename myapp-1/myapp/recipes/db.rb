#
# Cookbook Name:: myapp
# Recipe:: db
#
# Copyright 2012, Zühlke Engineering GmbH
#
# All rights reserved - Do Not Redistribute
#

# PostgreSQL soll auf allen IP Adressen hören...
node.override['postgresql']['config']['listen_addresses'] = "*"

# ...und Verbindungen aus dem 33.33.13.0/24 Subnetz erlauben
node.override['postgresql']['pg_hba'] = (
  node['postgresql']['pg_hba'] << {
    :type => 'host',
    :db => 'all',
    :user => 'all',
    :addr => "33.33.13.0/24",
    :method => 'password'
  }
)

# wir brauchen PostgreSQL als DB Server
include_recipe "postgresql::server"

# und dieses Rezept um DB User und DB anzulegen
include_recipe "database::postgresql"

# DB User für MyApp anlegen
postgresql_database_user node['myapp']['db']['username'] do
  connection :host => "127.0.0.1"
  action :create
  password node['myapp']['db']['password']
  privileges ['SUPERUSER']
end

# DB für MyApp anlegen
postgresql_database node['myapp']['db']['dbname'] do
  connection :host => "127.0.0.1"
  action :create
end

