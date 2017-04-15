# -*- encoding: utf-8 -*-
# stub: swanager-api 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "swanager-api".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Dokkur, Inc.".freeze]
  s.date = "2017-04-14"
  s.description = "client for the Swanager Remote API".freeze
  s.email = "eugene@dokkur.com".freeze
  s.files = ["LICENSE".freeze, "lib/swanager-api.rb".freeze, "lib/swanager.rb".freeze, "lib/swanager/base.rb".freeze, "lib/swanager/connection.rb".freeze, "lib/swanager/error.rb".freeze, "lib/swanager/version.rb".freeze]
  s.homepage = "https://github.com/dokkur/ruby-swanager".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.11".freeze
  s.summary = "A client for the Swanager Remote API. See http://swanager.com for more information".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<excon>.freeze, [">= 0.38.0"])
      s.add_runtime_dependency(%q<json>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<rspec-its>.freeze, [">= 0"])
    else
      s.add_dependency(%q<excon>.freeze, [">= 0.38.0"])
      s.add_dependency(%q<json>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<excon>.freeze, [">= 0.38.0"])
    s.add_dependency(%q<json>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec-its>.freeze, [">= 0"])
  end
end
