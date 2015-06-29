# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rackconnect/version'

Gem::Specification.new do |spec|
  spec.name          = "rackconnect"
  spec.version       = Rackconnect::VERSION
  spec.authors       = ["Matt Darby"]
  spec.email         = ["matt.darby@rackspace.com"]
  spec.summary       = "API Wrapper for RackConnect v3 service from Rackspace"
  spec.description   = "API Wrapper for RackConnect v3 service from Rackspace"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "sinatra"
  spec.add_development_dependency "thin"

  spec.add_dependency "activesupport"
  spec.add_dependency "activemodel"
  spec.add_dependency "rest-client"
end
