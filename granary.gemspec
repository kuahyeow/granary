# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "granary/version"

Gem::Specification.new do |spec|
  spec.name        = "granary"
  spec.version     = Granary::VERSION
  spec.authors     = ["Thong Kuah", "YouDo Limited"]
  spec.email       = ["kuahyeow@gmail.com"]
  spec.homepage    = "https://github.com/kuahyeow/granary"
  spec.summary     = "A Ruby library for the Harvest API"
  spec.description = "A Ruby library for the Harvest API"


  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec", "~> 2.8"
  spec.add_development_dependency "webmock", "~> 1.7"

  spec.add_runtime_dependency "faraday", "~> 0.8.7"
  spec.add_runtime_dependency "faraday_middleware", "~> 0.9.0"
end
