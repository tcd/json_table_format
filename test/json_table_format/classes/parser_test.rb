require "test_helper"

module ClassesTests
  class ParserTest < TestCase

    # @param case_data [TestData::TestData0]
    # @return [void]
    def run_test_case_assertions(case_data)
      parser = JsonTableFormat::Classes::Parser.new(case_data::INPUT)
      # output = parser.format()
      assert_equal(case_data::TYPE, parser.json_data_type)
      assert_matched_arrays(case_data::KEYS, parser.keys)
      if case_data::TYPE == :object
        assert_matched_arrays(case_data::TOP_KEYS, parser.top_keys)
        assert_equal(case_data::LONGEST_TOP_KEY_LENGTH, parser.longest_top_key_length)
      end
      # assert_equal(case_data::KEY_LENGTHS, parser.key_lengths)
      # assert_equal(case_data::VALUE_LENGTHS, parser.value_lengths)
      # assert_equal_and_print(case_data::OUTPUT, output)
    end

    test "case 1 - OBJECT" do
      run_test_case_assertions(TestData::TestData1)
    end

    test "case 2 - ARRAY" do
      run_test_case_assertions(TestData::TestData2)
    end

    test "case 3 - OBJECT" do
      run_test_case_assertions(TestData::TestData3)
    end

    test "case 4 - ARRAY" do
      run_test_case_assertions(TestData::TestData4)
    end

    # test "case 2 - ARRAY" do
    #   # @type [TestData::TestCase0]
    #   case_data = TestData::TestData2
    #   parser = JsonTableFormat::Classes::Parser.new(case_data::INPUT)
    #   # output = parser.format()
    #   assert_equal(case_data::TYPE, parser.json_data_type)
    #   assert_matched_arrays(case_data::KEYS, parser.keys)
    #   # assert_matched_arrays(case_data::TOP_KEYS, parser.top_keys)
    #   # assert_equal(case_data::KEY_LENGTHS, parser.key_lengths)
    #   # assert_equal(case_data::VALUE_LENGTHS, parser.value_lengths)
    #   # assert_equal_and_print(case_data::OUTPUT, output)
    # end

  end
end
