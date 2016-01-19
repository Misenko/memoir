require 'active_support/all'
require 'json'
require 'faraday'
require 'faraday_middleware'

module Memoir
  require File.join(File.dirname(__FILE__), 'memoir', 'version')
  require File.join(File.dirname(__FILE__), 'memoir', 'errors')
  require File.join(File.dirname(__FILE__), 'memoir', 'aggregator')
  require File.join(File.dirname(__FILE__), 'memoir', 'fill_policy')
  require File.join(File.dirname(__FILE__), 'memoir', 'filter_type')
  require File.join(File.dirname(__FILE__), 'memoir', 'time_period')
  require File.join(File.dirname(__FILE__), 'memoir', 'units')
  require File.join(File.dirname(__FILE__), 'memoir', 'downsample')
  require File.join(File.dirname(__FILE__), 'memoir', 'filter')
  require File.join(File.dirname(__FILE__), 'memoir', 'query')
  require File.join(File.dirname(__FILE__), 'memoir', 'request')
  require File.join(File.dirname(__FILE__), 'memoir', 'response')
  require File.join(File.dirname(__FILE__), 'memoir', 'client')
end
