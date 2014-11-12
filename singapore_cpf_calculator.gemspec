# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'singapore_cpf_calculator/version'

Gem::Specification.new do |spec|
  spec.name          = "singapore_cpf_calculator"
  spec.version       = SingaporeCPFCalculator::VERSION
  spec.authors       = ["Ronald Maravilla"]
  spec.email         = ["rmaravilla@payrollhero.com"]
  spec.summary       = "A Singapore's Central Provident Fund (CPF) contributions calculator."
  spec.description   = "A Singapore's Central Provident Fund (CPF) contributions calculator."
  spec.homepage      = "https://github.com/payrollhero/singapore_cpf_calculator"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  spec.add_dependency "activesupport"
end
