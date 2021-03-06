require_relative "lib/processable/version"

Gem::Specification.new do |spec|
  spec.name        = "processable"
  spec.version     = Processable::VERSION
  spec.authors     = ["Connected Bits"]
  spec.email       = ["info@connectedbits.com"]
  spec.homepage    = "https://www.connectedbits.com"
  spec.summary     = "Processable"
  spec.description = "Processable is a BPMN/DMN workflow gem for Rails apps."
  spec.license     = "MIT"
  
  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/connectedbits/processable"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", ">= 7.0.2.3"
  spec.add_dependency "json_logic", "~> 0.4.7"
  spec.add_dependency "awesome_print", "~> 1.9"
  spec.add_dependency "libv8-node", "16.10.0.0"
  spec.add_dependency "mini_racer", "~> 0.6.0"
  spec.add_development_dependency "m", "~> 1.5.0"
end
