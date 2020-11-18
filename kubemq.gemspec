# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name    = 'kubemq'
  s.authors = ['Jan Wiemers']
  s.email   = 'jan@anne-jan.de'
  s.version = '0.1.0'
  s.date    = '2020-11-09'
  s.summary = 'A library to handle kubemq in ruby'
  s.license = 'MIT'
  s.files   = [
    'lib/kubemq.rb'
  ]

  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})

  s.require_paths = ['lib']
  s.required_ruby_version = '>= 2.5.0'
  s.add_development_dependency 'activesupport'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rubocop'
  s.add_development_dependency 'shoulda-matchers', '~> 4.0'
  s.add_development_dependency 'webmock'
  s.add_runtime_dependency 'httparty', '~> 0.18.1'
end
