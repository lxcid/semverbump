# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

require "semverbump/version"

Gem::Specification.new do |s|
  s.name        = 'semverbump'
  s.authors     = ['Stan Chang Khin Boon']
  s.email       = 'me@lxcid.com'
  s.license     = 'MIT'
  s.homepage    = 'http://github.com/lxcid/semverbump'
  s.version     = SemVerBump::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'Semantic Versioning Bump'
  s.description = 'CLI for Bumping Sematic Versioning 2.0.0 (http://semver.org).'

  s.add_dependency 'commander', '~> 4.2'
  s.add_dependency 'terminal-table', '~> 1.4'
  s.add_dependency 'dotenv', '~> 1.0'
  
  s.add_development_dependency 'rake'
  
  s.files         = Dir["./**/*"].reject { |file| file =~ /\.\/(bin|log|pkg|script|spec|test|vendor)/ }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
