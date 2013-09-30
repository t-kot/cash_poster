# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cash_poster/version'

Gem::Specification.new do |spec|
  spec.name          = "cash_poster"
  spec.version       = CashPoster::VERSION
  spec.authors       = ["t-kot"]
  spec.email         = ["t.kotohata@gmail.com"]
  spec.description   = %q{Cashpost API Utility}
  spec.summary       = %q{Cashpost API Utility}
  spec.homepage      = "https://github.com/t-kot/cash_poster"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'webmock'
  spec.add_dependency 'nokogiri'
  spec.add_dependency 'activesupport'
end
