require "json_table_format/cli/helpers.rb"

require "json_table_format/cli/options.rb"

require "json_table_format/cli/program.rb"
require "json_table_format/cli/thor_cli.rb"

module JsonTableFormat
  # Code for the JsonTableFormat command line interface
  module CLI
    # @return [void]
    def self.start()
      # Program.new().main()
      # DevProgram.new().main()
      ThorCLI.start(ARGV)
    rescue Errno::ENOENT => e
      Helpers.error__file_not_found(e)
    rescue SystemExit, Interrupt
      puts("")
      exit(130)
    end
  end
end
