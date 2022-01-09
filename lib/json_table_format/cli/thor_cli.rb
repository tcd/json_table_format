module JsonTableFormat
  module CLI
    # Command Line Interface for JsonTableFormat
    class ThorCLI < Thor
      desc("version", "Display version")
      map(["-v", "--version"] => :version)

      # @return [void]
      def version()
        puts("json-table-format version #{JsonTableFormat::VERSION}")
        exit(0)
      end

    end
  end
end
