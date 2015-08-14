# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'string_scrubber/version'

Gem::Specification.new do |spec|
  spec.name          = "string_scrubber"
  spec.version       = StringScrubber::VERSION
  spec.authors       = ["Todd Tyree"]
  spec.email         = ["todd.tyree@digital.justice.gov.uk"]

  spec.summary       = %q{Drop in fix for JSON UTF-8 encoding errors in logstasher.}
  spec.description   = %q{Logstasher fails if controller params are not properly encoded. This fixes these.}
  spec.homepage      = "http://github.com/ministryofjustice/string_scrubber"
  spec.license       = 'ogl'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "string-scrub", "~> 0.0.5" unless String.respond_to?(:scrub!)

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"
  spec.add_development_dependency "json", "~> 1.8"
  spec.add_development_dependency "simplecov", "~> 0.10"
  spec.add_development_dependency "codeclimate-test-reporter", "~> 0.4"
end
