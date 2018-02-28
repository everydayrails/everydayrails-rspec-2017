# encoding: utf-8
#
# Licensed to the Software Freedom Conservancy (SFC) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The SFC licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

module Selenium
  module WebDriver
    module IE
      #
      # @api private
      #

      class Bridge < Remote::Bridge
        def initialize(opts = {})
          opts[:desired_capabilities] ||= Remote::Capabilities.internet_explorer

          unless opts.key?(:url)
            driver_path = opts.delete(:driver_path) || IE.driver_path
            port = opts.delete(:port) || Service::DEFAULT_PORT

            opts[:driver_opts] ||= {}
            if opts.key? :service_args
              WebDriver.logger.warn <<-DEPRECATE.gsub(/\n +| {2,}/, ' ').freeze
            [DEPRECATION] `:service_args` is deprecated. Pass switches using `driver_opts`
              DEPRECATE
              opts[:driver_opts][:args] = opts.delete(:service_args)
            end

            %i[log_level log_file implementation].each do |method|
              next unless opts.key? method
              WebDriver.logger.warn <<-DEPRECATE.gsub(/\n +| {2,}/, ' ').freeze
            [DEPRECATION] `#{method}` is deprecated. Pass switches using `driver_opts`
              DEPRECATE
              opts[:driver_opts][method] = opts.delete(method)
            end

            @service = Service.new(driver_path, port, opts.delete(:driver_opts))
            @service.start
            opts[:url] = @service.uri
          end

          if opts.delete(:introduce_flakiness_by_ignoring_security_domains)
            opts[:desired_capabilities][:ignore_protected_mode_settings] = true
          end
          opts[:desired_capabilities][:native_events] = opts.delete(:native_events) != false

          super(opts)
        end

        def browser
          :internet_explorer
        end

        def driver_extensions
          [DriverExtensions::TakesScreenshot]
        end

        def quit
          super
        ensure
          @service.stop if @service
        end
      end # Bridge
    end # IE
  end # WebDriver
end # Selenium
