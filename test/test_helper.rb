require "simplecov"

formatters = []
formatters << SimpleCov::Formatter::HTMLFormatter
# if ENV["CI"] == "true"
#   require "coveralls"
#   formatters << Coveralls::SimpleCov::Formatter
# end
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new(formatters)

SimpleCov.start do
  add_filter("/bin/")
  add_filter("/test/")

  # add_group "CLI", "lib/json_table_format/cli"
  add_group("Classes", ["lib/json_table_format/classes"])
  add_group("Util", "lib/json_table_format/util")

  track_files("lib/**/*.rb")
end

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "json_table_format"
require "pry"

require "minitest/autorun"
require "minitest/focus"
require "minitest/reporters"
Minitest::Reporters.use!([
  # Minitest::Reporters::DefaultReporter.new(color: true),
  Minitest::Reporters::SpecReporter.new,
])

# Return path of a file to be used in tests.
#
# Only works when tests are run from the project root.
#
# @param path [Pathname]
def file_fixture(path)
  return File.expand_path(File.join(File.dirname(__dir__), "test", "support", "fixtures", "files", path))
end

# ==============================================================================
# Custom Assertions
# ==============================================================================

module MiniTest::Assertions
  def assert_nothing_raised(*)
    yield
  end

  # Calls `assert_equal`; prints arguments if the assertion fails.
  #
  # @raise [ArgumentError] unless both arguments are strings
  # @param want [String] Expected
  # @param have [String] Actual
  def assert_equal_and_print(want, have)
    raise ArgumentError unless want.is_a?(String) && have.is_a?(String)

    clear = "\e[0m"
    _bold = "\e[1m"
    red = "\e[31m"
    green = "\e[32m"

    msg = <<~END
      #{'=' * 80}
      expected:
      #{green + want + clear}
      actual:
      #{red + have + clear}
      #{'=' * 80}
    END

    # assert_equal(want, have, "#{clear}\n#{'=' * 80}\nEXPECTED:\n\n#{want}\nACTUAL:\n\n#{have}\n#{'=' * 80}\n#{red}")
    assert_equal(want, have, ("\n" + clear + msg + red))
  end
end
