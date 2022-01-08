require_relative "lib/json_table_format/version"

Gem::Specification.new do |spec|
  spec.name          = "json_table_format"
  spec.version       = JsonTableFormat::VERSION
  spec.authors       = ["Clay Dunston"]
  spec.email         = ["dunstontc@gmail.com"]

  spec.summary       = "Format JSON in a compact, readable, aligned way."
  spec.description   = "Format JSON in a compact, readable, aligned way."
  spec.homepage      = "https://github.com/tcd/json_table_format"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"]    = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/tcd/json_table_format.git"
  spec.metadata["changelog_uri"]   = "https://github.com/tcd/json_table_format/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path("..", __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
