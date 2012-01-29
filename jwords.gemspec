# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jwords/version"

Gem::Specification.new do |s|
  s.name        = "jumping_words"
  s.version     = Jwords::VERSION
  s.authors     = ["Alex Dmitriev"]
  s.email       = ["alex@devmen.com"]
  s.homepage    = "https://github.com/devmen/jumping_words"
  s.summary     = %q{Jumping Words is gem for learning new words foreign languages}
  s.description = %q{Jumping Words is gem for learning new words foreign languages, only ubuntu}

  s.rubyforge_project = "jumping_words"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
