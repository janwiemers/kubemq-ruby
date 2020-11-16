Gem::Specification.new do |s|
  s.name    = 'kubemq'
  s.authors = ["Jan Wiemers"]
  s.email   = "jan@anne-jan.de"
  s.version = "0.1.0"
  s.date    = '2020-11-09'
  s.summary = 'A library to handle kubemq in ruby'
  s.license = "MIT"
  s.files   = [
    "lib/kubemq.rb"
  ]
  s.require_paths = ["lib"]
  s.required_ruby_version = ">= 2.5.0"
  s.add_development_dependency "rspec", "~> 3.10.0"
  s.add_runtime_dependency 'httparty', '~> 0.18.1'
end