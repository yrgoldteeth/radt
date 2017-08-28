# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "radt/version"

Gem::Specification.new do |spec|
  spec.name          = "radt"
  spec.version       = RADT::VERSION
  spec.authors       = ["Nicholas Fine"]
  spec.email         = ["nick@ndfine.com"]

  spec.summary       = %q{Updated version of Ruby-ADT gem to read Advantage Database files}
  spec.description   = %q{Updated version of Ruby-ADT gem to read Advantage Database files, originally found at https://github.com/chasemgray/Ruby-ADT}
  spec.homepage      = "https://github.com/yrgoldteeth/rabt"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
