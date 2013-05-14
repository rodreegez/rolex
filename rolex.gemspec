# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rolex/version'

Gem::Specification.new do |gem|
  gem.name          = "rolex"
  gem.version       = Rolex::VERSION
  gem.authors       = ["Adam"]
  gem.email         = ["electronicbattleweapon7@gmail.com"]
  gem.description   = %q{Rolex: simple roles, backed by redis}
  gem.summary       = %q{Rolex: simple roles, backed by redis}
  gem.homepage      = ""
  gem.license       = "MIT"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "redis"
  gem.add_dependency "redis-namespace"

  gem.add_development_dependency "rake"
  gem.add_development_dependency "rspec"
end
