require "json_table_format/util/json_data_type"
require "json_table_format/util/json_value_type"
require "json_table_format/util/get_keys"
require "json_table_format/util/get_length"
require "json_table_format/util/get_longest_lengths"
require "json_table_format/util/determine_json_data_type"
require "json_table_format/util/determine_json_value_type"

module JsonTableFormat
  # Utility code
  module Util

    # Directory where the gem is located.
    # @return [String]
    def self.root_dir
      return File.expand_path("../../../", __FILE__)
    end

  end
end
