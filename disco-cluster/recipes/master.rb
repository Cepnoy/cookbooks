#
# Cookbook Name:: disco
# Recipe:: master
#
include_recipe 'disco'

package "disco-master" do
  options "--force-yes"
end

template "#{node[:disco][:home]}/.ssh/id_dsa.pub" do
  source 'id_dsa.pub'
  owner node[:disco][:user]
  group node[:disco][:group]
  mode '0640'
  action :create
end

template "#{node[:disco][:home]}/.ssh/authorized_keys" do
  source 'authorized_keys'
  owner node[:disco][:user]
  group node[:disco][:group]
  mode '0644'
  action :create
end

cookbook_file "#{node[:disco][:home]}/count_words.py" do
  source 'count_words.py'
  owner node[:disco][:user]
  group node[:disco][:group]
  mode '0644'
  action :create
end

