# encoding: utf-8
#
# Cookbook Name:: campfire-deployment-test
# Recipe:: default
#
# Author:: P. Barrett Little (<barrett@barrettlittle.com>)
#
# Copyright 2013, P. Barrett Little
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

include_recipe 'campfire-deployment::default'

campfire_deployment 'jrs' do
  account 'jrs'
  token '20d7b9ee5829f54b703439a1d89c03dfc4a70d50'
  room 'The Cloud'
  release({
    deployer: 'TEST: Tiny Robot',
    environment: 'develop',
    revision: 'develop',
    application: 'EireneRx'
  })
end