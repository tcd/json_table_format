require "colorize"
require "optparse"

require "pry"

module JsonTableFormat
  module CLI
    # JsonTableFormat command line application
    #
    # See:
    #
    # - [`ARGF`](https://ruby-doc.org/core-2.6.5/ARGF.html)
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
        # self.parse_stdin() if STDIN.tty?()

        # puts(ARGV)

        # end

        # puts(ARGF.inspect)
        # if ARGF.filename == "-"
        #   input = ARGF.read
        #   parser = JsonTableFormat::Classes::Parser.new(input)
        #   output = parser.format()
        #   puts(output)
        #   exit(0)
        # else
        #   input = ARGF.read
        #   parser = JsonTableFormat::Classes::Parser.new(input)
        #   output = parser.format()
        #   puts(output)
        # end

        # until complete
        #   input = ARGF.read
        #   parser = JsonTableFormat::Classes::Parser.new(input)
        #   output = parser.format()
        #   puts(output)
        #   exit(0)
        # end
        # ARGF.each_line { |line| puts(line) }
        exit(0)
      rescue Errno::ENOENT => e
        self.error_file_not_found(e)
      end

      # @return [void]
      def parse_stdin()
        # exit(0) unless ARGF.filename == "-"
        # input = ARGF.read()
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

      # @param e [Errno::ENOENT]
      # @return [void]
      def error_file_not_found(e)
        print("File not found: ".colorize(color: :red))
        print(e.message.split("- ").dig(1))
        print("")
        exit(Errno::ENOENT::Errno)
      end

    end
  end
end
