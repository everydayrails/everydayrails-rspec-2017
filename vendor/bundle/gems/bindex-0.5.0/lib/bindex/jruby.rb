require 'bindex/jruby_internals'

java_import com.gsamokovarov.bindex.JRubyIntegration

JRubyIntegration.setup(JRuby.runtime)
