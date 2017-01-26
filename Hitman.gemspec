# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'Hitman/version'

Gem::Specification.new do |spec|
  spec.name          = "Hitman"
  spec.version       = Hitman::VERSION
  spec.authors       = ["Fabien Bal-Fontaine"]
  spec.email         = ["fabien_bf@hotmail.fr"]

  spec.summary       = %q{A bot developed in Ruby for Discord}
  spec.description   = %q{Hitman is a bot for Discord written in Ruby featuring many commands and utilities}
  spec.homepage      = "https://github.com/Submoon/Hitman"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "discordrb"
  spec.add_development_dependency "tsion-rbrainfuck"
end
