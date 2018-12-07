# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'schema_plus/db_default/version'

Gem::Specification.new do |gem|
  gem.name          = "schema_plus_db_default"
  gem.version       = SchemaPlus::DbDefault::VERSION
  gem.authors       = ["ronen barzel"]
  gem.email         = ["ronen@barzel.org"]
  gem.summary       = %q{Lets you set an ActiveRecord attribute to the db column's default value}
  gem.description   = %q{Defines constant ActiveRecord::DB_DEFAULT which, when saved as an attribute's value, causes the db to set the column to its default value.}
  gem.homepage      = "https://github.com/SchemaPlus/schema_plus_db_default"
  gem.license       = "MIT"

  gem.files         = `git ls-files -z`.split("\x0")
  gem.executables   = gem.files.grep(%r{^bin/}) { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "activerecord", ">= 4.2", "< 5.3"
  gem.add_dependency "schema_plus_core"

  gem.add_development_dependency "bundler", "~> 1.7"
  gem.add_development_dependency "rake", "~> 10.0"
  gem.add_development_dependency "rspec", "~> 3.0"
  gem.add_development_dependency "schema_dev", "~> 3.6"
  gem.add_development_dependency "simplecov"
  gem.add_development_dependency "simplecov-gem-profile"
end
