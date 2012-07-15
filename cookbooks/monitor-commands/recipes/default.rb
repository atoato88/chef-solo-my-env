#
# Cookbook Name:: monitor-commands
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

Chef::Log.info("install monitor commands")
["sysstat", "iotop", "htop", "iperf", "iftop"].each do |pkg|
  package pkg
end

