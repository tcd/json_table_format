require "pry"
require "optparse"

module JsonTableFormat
  module CLI
    # just poking around
    class DevProgram

      # @return [void]
      def initialize()
        self.main()
      end

      # @return [void]
      def main()
        binding.pry
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
        file_name = e.message.split("- ").dig(1)
        # puts("error: #{e.message}")
        puts("File not found: #{file_name}")
        exit(Errno::ENOENT::Errno)
      end

      # @return [void]
      def parse_stdin()
        # exit(0) unless ARGF.filename == "-"
        input = ARGF.read()
        parser = JsonTableFormat::Classes::Parser.new(input)
        output = parser.format()
        puts(output)
        exit(0)
      end

    end
  end
end
