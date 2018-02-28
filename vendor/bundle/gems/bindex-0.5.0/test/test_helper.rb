$LOAD_PATH << File.expand_path('../lib', __FILE__)

require 'minitest/autorun'
require 'bindex'

current_directory = File.dirname(File.expand_path(__FILE__))

# Fixtures are plain classes that respond to #call.
Dir["#{current_directory}/fixtures/**/*.rb"].each do |fixture|
  require fixture
end

class BaseTest < MiniTest::Test
  def self.test(name, &block)
    define_method("test_#{name}", &block)
  end
end
