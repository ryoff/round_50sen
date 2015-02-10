# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'round_50sen/version'

Gem::Specification.new do |spec|
  spec.name          = "round_50sen"
  spec.version       = Round50sen::VERSION
  spec.authors       = ["ryoff"]
  spec.email         = ["ryoffes@gmail.com"]
  spec.summary       = %q{round off to 0.50 JPY}
  spec.description   = %q{round off to 0.50 JPY}
  spec.homepage      = "https://github.com/ryoff/round_50sen"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'bigdecimal'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-parameterized"
end
