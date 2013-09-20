# -*- mode: ruby; coding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_record/simple_explain/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord-simple_explain"
  spec.version       = ActiveRecord::SimpleExplain::VERSION
  spec.authors       = ["wtnabe"]
  spec.email         = ["wtnabe@gmail.com"]
  spec.description   = %q{explain method for ActiveRecord 3.0.x and 3.1.x}
  spec.summary       = ""
  spec.homepage      = "https://github.com/wtnabe/activerecord-simple_explain"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 1.8.7"

  spec.add_runtime_dependency "activerecord", "< 4.0", ">= 3.0"
  spec.add_runtime_dependency "hirb-unicode"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
