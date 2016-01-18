$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'simplecov'

SimpleCov.start do
  add_filter "/vendor"
end

require 'memoir'

RSpec.configure do |config|
  config.color = true
  config.tty = true
  config.order = 'random'
end

Yell.new :stdout, :name => Object, :level => 'error', :format => Yell::DefaultFormat
Object.send :include, Yell::Loggable
