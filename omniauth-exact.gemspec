lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-exact/version'

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth',   '~> 1.6.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.4.0'

  gem.add_development_dependency 'bundler', '~> 1.0'

  gem.authors       = ['Michael Riviera']
  gem.email         = ['info@storecove.nl']
  gem.description   = 'OmniAuth 1.6 strategy for Exact online'
  gem.summary       = gem.description
  gem.homepage      = 'https://github.com/storecove/omniauth-exact'
  gem.licenses      = %w(MIT)

  gem.executables   = `git ls-files -- bin/*`.split("\n").collect { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'omniauth-exact'
  gem.require_paths = %w(lib)
  gem.version       = OmniAuth::Exact::VERSION
end
