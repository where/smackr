# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "smackr/version"

Gem::Specification.new do |s|
  s.name        = "smackr"
  s.version     = Smackr::VERSION
  s.authors     = ["pete gamache", "Bob Breznak"]
  s.email       = ["pete@where.com", "bob@where.com"]
  s.homepage    = "https://github.com/where/smackr/"
  s.summary     = %q{Smackr is a JRuby gem which wraps the Smack XMPP Java library}
  s.description = %q{Smackr is a JRuby gem which wraps the Smack XMPP Java library}
  s.platform    = Gem::Platform::CURRENT

  s.rubyforge_project = "smackr"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
