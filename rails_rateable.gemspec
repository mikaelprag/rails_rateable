# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_rateable/version'

Gem::Specification.new do |spec|
  spec.name          = "rails_rateable"
  spec.version       = RailsRateable::VERSION
  spec.authors       = ["Arun"]
  spec.email         = ["trustarun@yahoo.co.in"]
  spec.summary       = %q{rateable module to be used with rails 4}
  spec.description   = %q{rateable module to be used with rails 4. Made your module rateable by simply calling rateable in your Model}
  spec.homepage      = "https://github.com/trustarun/rails_rateable"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
