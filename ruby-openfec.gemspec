# coding: utf-8
 lib = File.expand_path('../lib', __FILE__)
 $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'open_fec/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-openfec"
  spec.version       = OpenFec::VERSION
  spec.authors       = "Chris Condon"
  spec.email         = "chris.m.condon@gmail.com"
  spec.summary       = %q{Ruby wrapper for Open FEC API (https://api.open.fec.gov/).}
  spec.description   = %q{Allows querying of the 18F Open FEC API via Ruby}
  spec.homepage      = "https://github.com/chriscondon/ruby-openfec"
  spec.license       = "MIT"

  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13"
end

