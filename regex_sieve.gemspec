# -*- encoding: utf-8 mode: ruby -*-
$:.push File.expand_path("../lib", __FILE__)
require "regex_sieve/version"

Gem::Specification.new do |s|
  s.name        = "regex_sieve"
  s.version     = RegexSieve::VERSION
  s.authors     = ["Sterling Paramore"]
  s.email       = ["gnilrets@gmail.com"]
  s.homepage    = "https://github.com/gnilrets/regex_sieve"
  s.license     = "MIT"
  s.summary     = "Regex Sieve"
  s.description = "A simple lookup sieve using regular expressions"

  s.rubyforge_project = "RegexSieve"

  s.add_development_dependency "rspec", ["~> 3.3"]

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
