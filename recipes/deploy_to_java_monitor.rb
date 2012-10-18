#
# Cookbook Name:: webobjects
# Recipe:: deploy_to_java_monitor
#
# Copyright 2011, RightsPro.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
app = node.run_state[:current_app]

receive_timeout_string = ""
if !app['webobjects_receive_timeout'].nil?
  receive_timeout_string = ", recvTimeout: '#{app['webobjects_receive_timeout']}'"
end
connect_timeout_string = ""
if !app['webobjects_connect_timeout'].nil?
  connect_timeout_string = ", cnctTimeout: '#{app['webobjects_connect_timeout']}'"
end
additional_arguments_string = ""
if !app['webobjects_additional_arguments'].nil?
  additional_arguments_string = ", additionalArgs: '#{app['webobjects_additional_arguments']}'"
end
num_instances = 1
if !app['webobjects_num_instances'].nil?
  num_instances = app['webobjects_num_instances']
end
  
script "deploy_to_java_monitor" do
  interpreter "bash"
  code <<-EOH
  curl -X DELETE http://#{node[:webobjects][:webobjects_JavaMonitor_host]}:#{node[:webobjects][:webobjects_JavaMonitor_port]}/#{node[:webobjects][:webobjects_apps_url]}/JavaMonitor.woa/ra/mApplications/#{app['deploy_name']}?pw=#{node[:webobjects][:webobjects_JavaMonitor_password]}
  curl -X POST -d "{id: '#{app['deploy_name']}',type: 'MApplication', name: '#{app['deploy_name']}', unixOutputPath: '#{node[:webobjects][:webobjects_WOLog_dir]}', unixPath: '#{node[:webobjects][:webobjects_WOApplications_dir]}/#{app['deploy_name']}.woa/#{app['deploy_name']}'#{receive_timeout_string}#{connect_timeout_string}#{additional_arguments_string}}" http://#{node[:webobjects][:webobjects_JavaMonitor_host]}:#{node[:webobjects][:webobjects_JavaMonitor_port]}/#{node[:webobjects][:webobjects_apps_url]}/JavaMonitor.woa/ra/mApplications.json?pw=#{node[:webobjects][:webobjects_JavaMonitor_password]}
  EOH
end

for i in 1..num_instances
  script "add_instance_to_java_monitor" do
    interpreter "bash"
    code <<-EOH
    curl -X GET http://#{node[:webobjects][:webobjects_JavaMonitor_host]}:#{node[:webobjects][:webobjects_JavaMonitor_port]}/#{node[:webobjects][:webobjects_apps_url]}/JavaMonitor.woa/ra/mApplications/#{app['deploy_name']}/addInstance?pw=#{node[:webobjects][:webobjects_JavaMonitor_password]}
    EOH
  end
end