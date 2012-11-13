# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-ghe/version'

Gem::Specification.new do |gem|
  gem.name          = "omniauth-ghe"
  gem.version       = OmniAuth::GHE::VERSION
  gem.authors       = ["Tatsuhiko Miyagawa"]
  gem.email         = ["miyagawa@bulknews.net"]
  gem.description   = %q{omniauth strategy for Github Enterprise}
  gem.summary       = %q{Omniauth strategy for Github Enterprise install}
  gem.homepage      = "https://github.com/miyagawa/omniauth-ghe"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.1'
  gem.add_dependency 'hashie'
  gem.add_development_dependency 'rspec', '~> 2.7'
end
