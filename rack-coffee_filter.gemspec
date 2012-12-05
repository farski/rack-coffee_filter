# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack-coffee_filter/version'

Gem::Specification.new do |gem|
  gem.name          = "rack-coffee_filter"
  gem.version       = Rack::CoffeeFilter::VERSION
  gem.authors       = ["Chris Kalafarski"]
  gem.email         = ["chris@farski.com"]
  gem.description   = %q{Makes coffeescript javascript}
  gem.summary       = %q{Cut down on your coffee cold turkey.}
  gem.homepage      = "https://github.com/farski/rack-coffee_filter"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "coffee-script"
end
