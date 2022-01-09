require "thor"

require "pry"

# rubocop:disable Style/DocumentationMethod
module JsonTableFormat
  module CLI
    # Command Line Interface for JsonTableFormat
    class ThorCLI < Thor

      default_task(:default)

      def self.exit_on_failure?()
        return true
      end

      # ========================================================================
      # Default
      # ========================================================================

      map(["-d", "--default"] => :default)
      desc("default", "default command")
      def default()
        puts("default()")
        exit(0)
      end

      # ========================================================================
      # File
      # ========================================================================

      map(["-f", "--file"] => :file)
      desc("-f [FILE]", "Format a file")
      def file(file_path)
        puts("file() { file_path: #{file_path} }")
        binding.pry
        exit(0)
      end

      # ========================================================================
      # STDIN
      # ========================================================================

      map(["-s", "--stdin"] => :stdin)
      desc("stdin", "Format JSON content from STDIN")
      def stdin()
        puts("stdin() { file_path: #{file_path}")
        exit(0)
      end

      # ========================================================================
      # Version
      # ========================================================================

      desc("version", "Display version")
      map(["-v", "--version"] => :version)
      def version()
        puts("json-table-format version #{JsonTableFormat::VERSION}")
        exit(0)
      end

    end
  end
end
# rubocop:enable Style/DocumentationMethod
