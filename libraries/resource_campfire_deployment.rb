# encoding: utf-8
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

require 'chef/resource'

class Chef
  class Resource
    class CampfireDeployment < Chef::Resource

      def initialize(name, run_context = nil)
        super

        @resource_name = :campfire_deployment
        @provider = Chef::Provider::CampfireDeployment
        @action = :announce_start
        @allowed_actions.push :announce_start,
          :announce_success, :announce_failure
      end

      def account(arg = nil)
        set_or_return(
          :account,
          arg,
          :kind_of => [String],
          :name_attribute => true
        )
      end

      def token(arg = nil)
        set_or_return(
          :token,
          arg,
          :kind_of => [String],
          :required => true
        )
      end

      def room(arg = nil)
        set_or_return(
          :room,
          arg,
          :kind_of => [String],
          :required => true
        )
      end

      def release(arg = nil)
        set_or_return(
          :release,
          arg,
          :kind_of => [Hash],
          :required => true
        )
      end

      def play(arg = nil)
        set_or_return(
          :play,
          arg,
          :kind_of => [String]
        )
      end
    end
  end
end
