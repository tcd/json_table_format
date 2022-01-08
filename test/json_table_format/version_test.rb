require "test_helper"
require "rubygems"

class VersionTest < TestCase

  test "that it has a version number" do
    refute_nil(JsonTableFormat::VERSION)
  end

  test "that versions match" do
    spec_path = File.join(JsonTableFormat::Util.root_dir, "json_table_format.gemspec")
    spec = Gem::Specification.load(spec_path)
    assert_equal(JsonTableFormat::VERSION, spec.version.to_s())
  end

  test "readme links to correct version" do
    search_string = "[docs]: https://www.rubydoc.info/gems/json_table_format/#{::JsonTableFormat::VERSION}"
    readme_path = File.join(JsonTableFormat::Util.root_dir, "README.md")
    readme = File.read(readme_path)
    assert(readme.include?(search_string))
  end

end
