# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pivotal/version'

Gem::Specification.new do |gem|
  gem.name          = "pivotal"
  gem.version       = Pivotal::VERSION
  gem.authors       = ["Josh Lane & Thom Mahoney"]
  gem.email         = ["jlane@engineyard.com", "tmahoney@engineyard.com"]
  gem.description   = %q{A client for Pivotal Tracker.}
  gem.summary       = %q{A client for Pivotal Tracker using cistern and nokogiri.}
  gem.homepage      = "https://github.com/thommahoney/pivotal"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "cistern", "~> 0.0.3"
  gem.add_dependency "xml-simple"
  gem.add_dependency "faraday"
  gem.add_dependency "faraday_middleware"
  gem.add_dependency "multi_xml"
end
