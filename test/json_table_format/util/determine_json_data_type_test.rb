require "test_helper"
require_relative "../../support/test_data.rb"

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

    # test "case 1 - OBJECT" do
    def test_case_1_object
      case_data = TestData::TestCase1
      want = case_data::TYPE
      have = JsonTableFormat::Util.determine_json_data_type(JSON.parse(case_data::INPUT))
      assert_equal(want, have)
    end

    # test "case 2 - ARRAY" do
    def test_case_2_array
      case_data = TestData::TestCase2
      want = case_data::TYPE
      have = JsonTableFormat::Util.determine_json_data_type(JSON.parse(case_data::INPUT))
      assert_equal(want, have)
    end

    def test_case_3_object
      case_data = TestData::TestCase3
      want = case_data::TYPE
      have = JsonTableFormat::Util.determine_json_data_type(JSON.parse(case_data::INPUT))
      assert_equal(want, have)
    end

  end
end
