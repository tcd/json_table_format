require "fileutils"
require "pathname"
require "thor"

# rubocop:disable Style/DocumentationMethod
module JsonTableFormat
  module CLI
    # Command Line Interface for JsonTableFormat
    class ThorCLI < Thor

      default_task(:default)

      # class_option(:verbose, type: :boolean, default: false, description: "print extra output")

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

      option(
        :output,
        type: :string,
        default: nil,
        aliases: ["-o"],
        desc: "file to write output to",
        banner: "PATH",
      )
      option(
        :in_place,
        type: :boolean,
        default: false,
        aliases: ["-i"],
        desc: "format file contents in place",
      )
      option(
        :backup,
        type:
        :boolean,
        default: false,
        aliases: ["-b"],
        desc: "if using 'in_place', backup the original file",
      )
      map(["-f", "--file"] => :file)
      desc("-f, --file [FILE]", "file - Format a file")
      def file(file_path)
        input  = File.read(file_path)
        parser = JsonTableFormat::Classes::Parser.new(input)
        output = parser.format()
        if ((options[:output]&.length || 0) > 0)
          Helpers.overwrite_file(options[:output], output)
        elsif options[:in_place]
          Helpers.overwrite_file(file_path, output, backup: options[:backup])
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
      desc("-v, --version", "version - Display version")
      def version()
        puts("json-table-format version #{JsonTableFormat::VERSION}")
        exit(0)
      end

    end
  end
end
# rubocop:enable Style/DocumentationMethod
