#
# Author::  Joshua Timberman (<joshua@opscode.com>)
# Cookbook Name:: php
# Recipe:: pear
#
# Copyright 2009, Opscode, Inc.
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

define :pear_module, :module, :enable => true do
  
  include_recipe "php::pear"
  
  if params[:enable]
    execute "/usr/bin/pear install -a #{params[:module]}" do
      only_if "/bin/sh -c '! /usr/bin/pear info #{params[:module]} 2>&1 1>/dev/null"
    end
  end
  
end

define :pear_channel, :channel, :enable => true do
  
  include_recipe "php::pear"
  
  if params[:enable]
    execute "/usr/bin/pear channel-discover #{params[:channel]}" do
      only_if "/bin/sh -c '! /usr/bin/pear/channel-info #{params[:channel]} 2>&1 1>/dev/null"
    end
  end
  
end