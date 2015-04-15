lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'omniauth-exactnl/version'

Gem::Specification.new do |gem|
  gem.add_dependency 'omniauth',   '~> 1.2'
  gem.add_dependency 'omniauth-oauth2', '>= 1.1.1', '< 2.0'

  gem.add_development_dependency 'bundler', '~> 1.0'

  gem.authors       = ['Marek Podlesny']
  gem.email         = ['zzk@chickenkiller.org']
  gem.description   = 'OmniAuth strategy for Exact.nl'
  gem.summary       = gem.description
  gem.homepage      = 'https://github.com/zzk/omniauth-exactnl'
  gem.licenses      = %w(MIT)

  gem.executables   = `git ls-files -- bin/*`.split("\n").collect { |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = 'omniauth-exactnl'
  gem.require_paths = %w(lib)
  gem.version       = OmniAuth::Exactnl::VERSION
end
