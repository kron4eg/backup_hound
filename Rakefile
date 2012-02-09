# encoding: utf-8

require 'rubygems' if RUBY_VERSION < '1.9'
require 'bundler/setup'
require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'rake/testtask'
require 'rdoc/task'

RSpec::Core::RakeTask.new(:spec)

task :test => :spec
task :default => :spec

desc 'Generate documentation for the sms_fu plugin.'
Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'Backup Hound'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
