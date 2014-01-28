#
# Cookbook Name:: disco
# Recipe:: default
#
template "/etc/apt/sources.list.d/disco_cluster.list" do
  source 'disco_cluster.list'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

execute "aptitude update"

package "disco-node" do
  options "--force-yes"
end

directory "#{node[:disco][:home]}/.ssh" do
  owner node[:disco][:user]
  group node[:disco][:group]
  mode '0755'
  action :create
end

cookbook_file "#{node[:disco][:home]}/.ssh/id_dsa" do
  source 'id_dsa'
  owner node[:disco][:user]
  group node[:disco][:group]
  mode '0600'
  action :create
end

cookbook_file "#{node[:disco][:home]}/.erlang.cookie" do
  source 'erlang.cookie'
  owner node[:disco][:user]
  group node[:disco][:group]
  mode '0600'
  action :create
end

template "#{node[:disco][:home]}/.ssh/authorized_keys" do
  source 'authorized_keys'
  owner node[:disco][:user]
  group node[:disco][:group]
  mode '0644'
  action :create
end

cookbook_file "#{node[:disco][:home]}/.ssh/config" do
  source 'ssh_config'
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

