module Memoir::Errors
  require File.join(File.dirname(__FILE__), 'errors', 'standard_error')
  require File.join(File.dirname(__FILE__), 'errors', 'argument_error')
  Dir.glob(File.join(File.dirname(__FILE__), self.name.demodulize.underscore, '*.rb')) { |error_file| require error_file.chomp('.rb') }
end
