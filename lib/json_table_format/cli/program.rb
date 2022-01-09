require "optparse"

module JsonTableFormat
  module CLI
    # JsonTableFormat command line application
    class Program

      # @return [JsonTableFormat::CLI::Options]
      attr_accessor :options

      # @return [void]
      def initialize()
        self.options = self.parse_options()
        self.main()
      end

      # @return [void]
      def main()
        exit(0)
      rescue Errno::ENOENT => e
        Helpers.error__file_not_found(e)
      end

      # @return [void]
      def parse_stdin()
        input = Helpers.read_stdin()
        parser = JsonTableFormat::Classes::Parser.new(input)
        output = parser.format()
        puts(output)
        exit(0)
      rescue Errno::ENOENT => e
        self.error_file_not_found(e)
      end

      # @return [JsonTableFormat::CLI::Options]
      def parse_options()
        options = {}

        opt_parser = OptionParser.new do |opt|
          opt.banner = "Usage: #{$0} [OPTIONS]"
          opt.separator("")
          opt.separator("OPTIONS")

          opt.on("-h", "--help", "display usage information") do |heading|
            options[:heading] = heading
          end

          opt.on("-V", "--version", "display version information") do
            options[:version] = true
          end
        end

        opt_parser.parse!()

        return options
      end

    end
  end
end
