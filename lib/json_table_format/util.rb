require "json_table_format/util/json_data_type"
require "json_table_format/util/determine_json_data_type"

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
