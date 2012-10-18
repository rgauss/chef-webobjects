#
# Cookbook Name:: webobjects
# Attributes:: webobjects
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

default[:app_environment] = "_default"

default[:webobjects][:wonder_source_remote_url]    = "http://webobjects.s3.amazonaws.com/Wonder-Source.tar.gz"
default[:webobjects][:wonder_source_local_package]    = "Wonder-Source.tar.gz"
default[:webobjects][:wonder_source_dir_Utilities] = "Utilities"
default[:webobjects][:wonder_source_dir_Adaptors] = "Utilities/Adaptors"

default[:webobjects][:webobjects_apache_conf_remote_url] = "http://webobjects.s3.amazonaws.com/apache.conf"
default[:webobjects][:webobjects_apache_conf_local_name] = "webobjects.conf"

default[:webobjects][:webobjects_user] = "appserver"
default[:webobjects][:webobjects_group] = "appserveradm"
default[:webobjects][:webobjects_site_url] = "http://localhost"
default[:webobjects][:webobjects_resources_url] = "/WebObjects"
default[:webobjects][:webobjects_apps_url] = "/cgi-bin/WebObjects"
default[:webobjects][:webobjects_wotaskd_host] = "localhost"
default[:webobjects][:webobjects_wotaskd_port] = "1085"
default[:webobjects][:webobjects_wotaskd_interval] = "10"
default[:webobjects][:webobjects_wotaskd_receive_timeout] = "5000"
default[:webobjects][:webobjects_wotaskd_startup_wait] = "10"
default[:webobjects][:webobjects_JavaMonitor_host] = "127.0.0.1"
default[:webobjects][:webobjects_JavaMonitor_port] = "56789"
default[:webobjects][:webobjects_JavaMonitor_receive_timeout] = "10000"

default[:webobjects][:webobjects_WOLocalRootDirectory_dir] = "/opt"
default[:webobjects][:webobjects_WOApplications_dir] = "/opt/WOApplications"
default[:webobjects][:webobjects_WOWebServerResources_dir] = "/opt/WOWebServerResources"
default[:webobjects][:webobjects_WODeployment_dir] = "/opt/WODeployment"
default[:webobjects][:webobjects_WOLog_dir] = "/var/log/webobjects"

default[:webobjects][:webobjects_JavaMonitor_remote_url] = "https://s3-eu-west-1.amazonaws.com/webobjects/JavaMonitor.tgz"
default[:webobjects][:webobjects_JavaMonitor_local_package] = "JavaMonitor.tgz"
default[:webobjects][:webobjects_JavaMonitor_app] = "JavaMonitor.woa"
default[:webobjects][:webobjects_JavaMonitor_password] = "wonderful"
default[:webobjects][:webobjects_wotaskd_remote_url] = "https://s3-eu-west-1.amazonaws.com/webobjects/wotaskd.tgz"
default[:webobjects][:webobjects_wotaskd_local_package] = "wotaskd.tgz"
default[:webobjects][:webobjects_wotaskd_app] = "wotaskd.woa"

default[:webobjects][:file_limit] = "200000"
default[:webobjects][:security_limit_hard] = "200000"
default[:webobjects][:security_limit_soft] = "200000"
  
default[:webobjects][:deploy_to_repo_path] = "repo"
default[:webobjects][:deploy_to_repo_application_path] = "repo"
