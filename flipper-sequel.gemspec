# -*- encoding: utf-8 -*-
require File.expand_path('../lib/flipper/version', __FILE__)
require File.expand_path('../lib/flipper/metadata', __FILE__)

flipper_sequel_files = ->(file) { file =~ /sequel/ }

Gem::Specification.new do |gem|
  gem.authors       = ['John Nunemaker']
  gem.email         = ['nunemaker@gmail.com']
  gem.summary       = 'Sequel adapter for Flipper'
  gem.description   = 'Sequel adapter for Flipper'
  gem.license       = 'MIT'
  gem.homepage      = 'https://github.com/jnunemaker/flipper'

  extra_files = [
    'lib/flipper/version.rb',
  ]
  gem.files         = `git ls-files`.split("\n").select(&flipper_sequel_files) + extra_files # rubocop:disable Metrics/LineLength
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n").select(&flipper_sequel_files) # rubocop:disable Metrics/LineLength
  gem.name          = 'flipper-sequel'
  gem.require_paths = ['lib']
  gem.version       = Flipper::VERSION
  gem.metadata      = Flipper::METADATA

  gem.add_dependency 'flipper', "~> #{Flipper::VERSION}"
  gem.add_dependency 'sequel', '>= 4.0.0', '< 6'
end
