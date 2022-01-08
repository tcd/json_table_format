require "test_helper"

class JsonTableFormatTest < Minitest::Test
  def test_that_it_has_a_version_number()
    refute_nil(::JsonTableFormat::VERSION)
  end
end
