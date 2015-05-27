#
# Cookbook Name:: atom
# Recipe:: install_nodejs
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node['platform_family'] == 'rhel'
  platform_version = node['platform_version'].to_i

  if platform_version > 5
    package 'nodejs'
    package 'npm'
  elsif 
    bash "run-node-setup" do
      user "root"
      group "root"
      code "curl -sL https://rpm.nodesource.com/setup | bash -"
      not_if "which nodejs"
    end
    package 'nodejs'
  end
end

execute "install NPM package" do
  command "npm install -g less gulp"
end