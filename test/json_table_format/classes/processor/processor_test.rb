require "test_helper"

module ClassesTests
  class ProcessorTest < TestCase

    test "case 2 - ARRAY" do
      # @type [TestData::TestCase0]
      case_data = TestData::TestData2
      parser = JsonTableFormat::Classes::Parser.new(case_data::INPUT)
      # output = parser.format()
      assert_equal(case_data::TYPE, parser.json_data_type)
      # assert_matched_arrays(case_data::KEYS, parser.keys)
      # assert_matched_arrays(case_data::TOP_KEYS, parser.top_keys)
      # assert_equal(case_data::KEY_LENGTHS, parser.key_lengths)
      # assert_equal(case_data::VALUE_LENGTHS, parser.value_lengths)
    end

  end
end
