require File.expand_path('../lib/swanager-api/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'swanager-api'
  s.version = Swanager::VERSION
  s.authors = ['Dokkur, Inc.']
  s.description = 'Client for the Swanager Remote API'
  s.email = 'eugene@dokkur.com'
  s.homepage = 'https://github.com/dokkur/ruby-swanager'
  s.licenses = 'MIT'
  s.summary = 'A client for the Swanager Remote API. See http://swanager.com for more information'

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -z spec/`.split("\u0000")

  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rspec-its'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'vcr'

  s.add_dependency 'excon'
  s.add_dependency 'json'
end
