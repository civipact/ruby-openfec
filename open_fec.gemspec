# coding: utf-8
 lib = File.expand_path('../lib', __FILE__)
 $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'open_fec/version'

Gem::Specification.new do |spec|
  spec.name          = "open_fec"
  spec.version       = OpenFec::VERSION
  spec.authors       = ["Chris Condon"]
  spec.email         = ["chris.m.condon@gmail.com"]
  spec.summary       = %q{Ruby wrapper for Open FEC API (https://api.open.fec.gov/).}
  spec.description   = %q{Allows querying of the 18Fs open FEC API via Ruby}
  spec.homepage      = "https://github.com/chriscondon/ruby-openfec"
  spec.license       = "MIT"

  spec.require_paths = ["lib"]

  # spec.add_development_dependency "bundler", "~> 1.7"
  # spec.add_development_dependency "rake", "~> 10.0"
  # spec.add_development_dependency "rspec", "~> 3.1"
  # spec.add_development_dependency "pry", "~> 0.10"
  # spec.add_development_dependency "yard"
  spec.add_dependency "httparty", "~> 0.13"
end
