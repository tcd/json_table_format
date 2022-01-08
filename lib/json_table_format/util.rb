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
