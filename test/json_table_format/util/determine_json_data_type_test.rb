require "test_helper"

module UtilTests
  class DetermineJsonDataTypeTest < TestCase

    # @return [return_type]
    def determine_json_data_type(json)
      return JsonTableFormat::Util.determine_json_data_type(JSON.parse(json))
    end

    test "empty object - OTHER" do
      want = JsonTableFormat::Util::JsonDataType::OTHER
      have = determine_json_data_type("{}")
      assert_equal(want, have)
    end

    test "case 1 - OBJECT" do
      case_data = TestData::TestData1
      want = case_data::TYPE
      have = determine_json_data_type(case_data::INPUT)
      assert_equal(want, have)
    end

    test "case 2 - ARRAY" do
      case_data = TestData::TestData2
      want = case_data::TYPE
      have = determine_json_data_type(case_data::INPUT)
      assert_equal(want, have)
    end

    test "case 3 - OBJECT" do
      case_data = TestData::TestData3
      want = case_data::TYPE
      have = determine_json_data_type(case_data::INPUT)
      assert_equal(want, have)
    end

  end
end
