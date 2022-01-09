require "thor"
require "fileutils"

require "pry"

# rubocop:disable Style/DocumentationMethod
module JsonTableFormat
  module CLI
    # Command Line Interface for JsonTableFormat
    class ThorCLI < Thor

      default_task(:default)

      class_option(:verbose, type: :boolean, default: false, description: "print extra output")

      def self.exit_on_failure?()
        return true
      end

      # @return [String]
      def self._usage()
        return <<~STR
          With no FILE, or when FILE is "-", read standard input.
        STR
      end

      # ========================================================================
      # Default
      # ========================================================================

      desc("default", "default - default command", hide: true)
      def default()
        exit(0)
      end

      # ========================================================================
      # File
      # ========================================================================

      option(:overwrite, type: :boolean, default: false, desc: "format file contents in place")
      option(:backup, type: :boolean, default: false, desc: "if using 'overwrite', create a backup of the original file")
      map(["-f", "--file"] => :file)
      desc("-f [FILE]", "file - Format a file")
      def file(file_path)
        input  = File.read(file_path)
        parser = JsonTableFormat::Classes::Parser.new(input)
        output = parser.format()
        if options[:overwrite]
          Helpers.overwrite_file(file_path, output, options[:backup])
        else
          puts(output)
        end
        exit(0)
      end

      # ========================================================================
      # STDIN
      # ========================================================================

      map([
        "-",
        "--",
        "-s",
        "--stdin",
      ] => :stdin)
      desc("-s, --stdin", "stdin - Format JSON content from standard input")
      def stdin(*_args)
        puts("stdin()")
        input  = Helpers.read_stdin()
        parser = JsonTableFormat::Classes::Parser.new(input)
        output = parser.format()
        puts(output)
        exit(0)
      end

      # ========================================================================
      # Version
      # ========================================================================

      map(["-v", "--version"] => :version)
      desc("version", "version - Display version")
      def version()
        puts("json-table-format version #{JsonTableFormat::VERSION}")
        exit(0)
      end

    end
  end
end
# rubocop:enable Style/DocumentationMethod
