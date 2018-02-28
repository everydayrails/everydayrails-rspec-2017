require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

case RUBY_ENGINE
when 'ruby'
  require 'rake/extensiontask'

  Rake::ExtensionTask.new('bindex') do |ext|
    ext.name = 'cruby'
    ext.lib_dir = 'lib/bindex'
  end

  task default: [:clean, :compile, :test]
when 'jruby'
  require 'rake/javaextensiontask'

  Rake::JavaExtensionTask.new('bindex') do |ext|
    ext.name = 'jruby_internals'
    ext.lib_dir = 'lib/bindex'
  end

  task default: [:clean, :compile, :test]
else
  task default: [:test]
end
