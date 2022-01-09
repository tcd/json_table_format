require "json_table_format/cli/options.rb"
require "json_table_format/cli/program.rb"

module JsonTableFormat
  # Code for the JsonTableFormat command line interface
  module CLI
    # @return [void]
    def self.start()
      Program.new().main()
    end
  end
end
