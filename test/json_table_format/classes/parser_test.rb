require "test_helper"

module ClassesTests
  class ParserTest < TestCase

    def run_test_case_assertions(case_data)
      parser = JsonTableFormat::Classes::Parser.new(case_data::INPUT)
      output = parser.format()
      assert_equal(case_data::TYPE, parser.json_data_type)
      assert_matched_arrays(case_data::KEYS, parser.keys)
      if case_data::TYPE == :object
        assert_matched_arrays(case_data::TOP_KEYS, parser.top_keys)
        assert_equal(case_data::LONGEST_TOP_KEY_LENGTH, parser.longest_top_key_length)
      end
      assert_equal(case_data::KEY_LENGTHS, parser.key_lengths)
      assert_equal(case_data::VALUE_LENGTHS, parser.value_lengths)
      assert_equal(case_data::OUTPUT, output)
    end

    test("case 1 OBJECT") { run_test_case_assertions(TestData::TestData1) }
    test("case 2 ARRAY")  { run_test_case_assertions(TestData::TestData2) }
    test("case 3 OBJECT") { run_test_case_assertions(TestData::TestData3) }
    test("case 4 ARRAY")  { run_test_case_assertions(TestData::TestData4) }
    test("case 5 ARRAY")  { run_test_case_assertions(TestData::TestData5) }

  end
end
