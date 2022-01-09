require "json_table_format/cli/options.rb"
require "json_table_format/cli/program.rb"
require "json_table_format/cli/thor_cli.rb"
require "json_table_format/cli/dev_program.rb"

module JsonTableFormat
  # Code for the JsonTableFormat command line interface
  module CLI
    # @return [void]
    def self.start()
      # Program.new().main()
      DevProgram.new().main()
      # ThorCLI.start(ARGV)
    end
  end
end
