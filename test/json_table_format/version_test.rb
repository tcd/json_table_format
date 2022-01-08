require "test_helper"
require "rubygems"

class VersionTest < Minitest::Test

  def test_that_it_has_a_version_number
    refute_nil(JsonTableFormat::VERSION)
  end

  def test_that_versions_match
    spec_path = File.join(JsonTableFormat::Util.root_dir, "json_table_format.gemspec")
    spec = Gem::Specification.load(spec_path)
    assert_equal(JsonTableFormat::VERSION, spec.version.to_s())
  end

  def test_readme_links_to_correct_version
    search_string = "[docs]: https://www.rubydoc.info/gems/json_table_format/#{::JsonTableFormat::VERSION}"
    readme_path = File.join(JsonTableFormat::Util.root_dir, "README.md")
    # binding.pry
    readme = File.read(readme_path)
    assert(readme.include?(search_string))
  end

end
