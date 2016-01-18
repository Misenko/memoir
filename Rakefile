require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'rubygems/tasks'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

Gem::Tasks.new(build: { tar: true, zip: true }, sign: { checksum: true, pgp: false })
