# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'memoir/version'

Gem::Specification.new do |spec|
  spec.name          = "memoir"
  spec.version       = Memoir::VERSION
  spec.authors       = ["Michal Kimle"]
  spec.email         = ["kimle.michal@gmail.com"]

  spec.summary       = %q{Client library for easy communication with OpenTSDB}
  spec.homepage      = "https://github.com/Misenko/memoir"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency 'simplecov', '~> 0.11'
  spec.add_development_dependency 'rubocop', '~> 0.36'

  spec.add_runtime_dependency 'faraday', '~> 0.9'
  spec.add_runtime_dependency 'faraday_middleware', '~> 0.10'
  spec.add_runtime_dependency 'yell', '~> 2.0'
  spec.add_runtime_dependency 'activesupport', '~> 4.2'
end
