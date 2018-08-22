# coding: utf-8

lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/rename_android_package/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-rename_android_package'
  spec.version       = Fastlane::RenameAndroidPackage::VERSION
  spec.author        = 'Josh Holtz'
  spec.email         = 'me@joshholtz.com'

  spec.summary       = 'Renames Android package'
  # spec.homepage      = "https://github.com/joshdholtz/fastlane-plugin-rename_android_package"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency('pry')
  spec.add_development_dependency('bundler')
  spec.add_development_dependency('rspec')
  spec.add_development_dependency('rspec_junit_formatter')
  spec.add_development_dependency('rake')
  spec.add_development_dependency('rubocop', '0.49.1')
  spec.add_development_dependency('rubocop-require_tools')
  spec.add_development_dependency('simplecov')
  spec.add_development_dependency('fastlane', '>= 2.102.0')
end
