#
# Cookbook Name:: myapp
# Recipe:: default
#
# Copyright 2012, Zühlke Engineering GmbH
#
# All rights reserved - Do Not Redistribute
#

# per default läuft beides auf der gleichen Maschine
include_recipe "myapp::db"
include_recipe "myapp::web"