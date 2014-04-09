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

require 'chef/provider'

class Chef
  class Provider
    class CampfireDeployment < Chef::Provider

      def initialize(new_resource, run_context = nil)
        @new_resource = new_resource

        @run_context = run_context
        @run_context.include_recipe('campfire-deployment::default')

        super(new_resource, run_context)
      end

      def load_current_resource; end

      def whyrun_supported?
        true
      end

      def action_announce_start
        room.paste start_message
        room.play sound if sound
      end

      def action_announce_success
        room.paste success_message
        room.play sound if sound
      end

      def action_announce_failure
        room.paste failure_message
        room.play sound if sound
      end

      def room
        begin
          require 'campy'
        rescue LoadError
          Chef::Log.error(
            "Missing gem 'campy'. Use the default recipe to install it."
          )
        end

        @room ||= ::Campy::Room.new(
          :account => new_resource.account,
          :token => new_resource.token,
          :room => new_resource.room
        )
      end

      def start_message
        <<-EOH
#{deployer} is deploying the #{revision} branch of #{application} to #{environment}.
        EOH
      end

      def success_message
        <<-EOH
#{deployer} has successfully deployed the #{revision} branch of #{application} to #{environment}.
        EOH
      end

      def failure_message
        <<-EOH
The deployment of the #{revision} branch of #{application} to #{environment} has failed.
        EOH
      end

      def sound
        new_resource.play
      end

      def release
        new_resource.release
      end

      def deployer
        release[:deployer]
      end

      def revision
        release[:revision]
      end

      def application
        release[:application]
      end

      def environment
        release[:environment]
      end
    end
  end
end
