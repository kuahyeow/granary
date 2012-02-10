# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "granary/version"

Gem::Specification.new do |s|
  s.name        = "granary"
  s.version     = Granary::VERSION
  s.authors     = ["Thong Kuah", "YouDo Limited"]
  s.email       = ["kuahyeow@gmail.com"]
  s.homepage    = "https://github.com/kuahyeow/granary"
  s.summary     = "A Ruby library for the Harvest API"
  s.description = "A Ruby library for the Harvest API"


  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec", "~> 2.8"
  s.add_development_dependency "webmock", "~> 1.7"

  s.add_runtime_dependency "faraday", "~> 0.7.6"
  s.add_runtime_dependency "faraday-stack", "~> 0.1.4"
  s.add_runtime_dependency "yajl-ruby"
end
