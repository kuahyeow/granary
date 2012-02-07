# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "harvester/version"

Gem::Specification.new do |s|
  s.name        = "harvester"
  s.version     = Harvester::VERSION
  s.authors     = ["Thong Kuah"]
  s.email       = ["kuahyeow@gmail.com"]
  s.homepage    = ""
  s.summary     = "An opinionated client for the Harvest Time tracker API"
  s.description = "An opinionated client for the Harvest Time tracker API"


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
