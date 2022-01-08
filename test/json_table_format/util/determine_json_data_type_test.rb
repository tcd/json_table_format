require "test_helper"

module UtilTests
  class DetermineJsonDataTypeTest < TestCase

    # def setup
    #   @func = JsonTableFormat::Util.determine_json_data_type
    # end

    test "empty object - OTHER" do
      want = JsonTableFormat::Util::JsonDataType::OTHER
      have = JsonTableFormat::Util.determine_json_data_type({})
      assert_equal(want, have)
    end

    test "case 1 - OBJECT" do
      case_data = TestData::TestCase1
      want = case_data::TYPE
      have = JsonTableFormat::Util.determine_json_data_type(JSON.parse(case_data::INPUT))
      assert_equal(want, have)
    end

    test "case 2 - ARRAY" do
      case_data = TestData::TestCase2
      want = case_data::TYPE
      have = JsonTableFormat::Util.determine_json_data_type(JSON.parse(case_data::INPUT))
      assert_equal(want, have)
    end

    test "case 3 - OBJECT" do
      case_data = TestData::TestCase3
      want = case_data::TYPE
      have = JsonTableFormat::Util.determine_json_data_type(JSON.parse(case_data::INPUT))
      assert_equal(want, have)
    end

  end
end
