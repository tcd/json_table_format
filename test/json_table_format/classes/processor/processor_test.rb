require "test_helper"

module ClassesTests
  class ProcessorTest < TestCase

    test "case 2 - ARRAY" do
      case_data = TestData::TestCase2
      parser = JsonTableFormat::Classes::Parser.new(case_data::INPUT)
      # output = parser.format()
      assert_equal(case_data::TYPE, parser.json_data_type)
      # assert_equal(parser., case_data::TYPE)
    end

  end
end
