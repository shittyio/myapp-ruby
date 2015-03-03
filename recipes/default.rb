#
# Cookbook Name:: myapp-ruby
# Recipe:: default
#
# Copyright (C) 2015 YOUR_NAME
#
# All rights reserved - Do Not Redistribute

include_recipe 'rbenv::default'
include_recipe 'rbenv::ruby_build'

myapp = node['myapp']

myapp['ruby']['versions'].each do |version, install|
  # if we should install, install the ruby version and install bundler for that
  # ruby version
  if install
    rbenv_ruby version

    rbenv_gem "bundler" do
      ruby_version version
    end
  end
end
