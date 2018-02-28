# -*- encoding: utf-8 -*-
# stub: geocoder 1.4.4 ruby lib

Gem::Specification.new do |s|
  s.name = "geocoder".freeze
  s.version = "1.4.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Alex Reisner".freeze]
  s.date = "2017-05-17"
  s.description = "Provides object geocoding (by street or IP address), reverse geocoding (coordinates to street address), distance queries for ActiveRecord and Mongoid, result caching, and more. Designed for Rails but works with Sinatra and other Rack frameworks too.".freeze
  s.email = ["alex@alexreisner.com".freeze]
  s.executables = ["geocode".freeze]
  s.files = ["bin/geocode".freeze]
  s.homepage = "http://www.rubygeocoder.com".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.7.3".freeze
  s.summary = "Complete geocoding solution for Ruby.".freeze

  s.installed_by_version = "2.7.3" if s.respond_to? :installed_by_version
end
