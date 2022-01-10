require "fileutils"
require "pathname"
require "timeout"

# require "pry"

module JsonTableFormat
  module CLI
    # Utility code for the CLI
    # See:
    #
    # - [`ARGF`](https://ruby-doc.org/core-2.6.5/ARGF.html)
    # - [`Pathname`](https://ruby-doc.org/stdlib-2.6.5/libdoc/pathname/rdoc/Pathname.html)
    module Helpers

      # @param err [Errno::ENOENT]
      # @return [void]
      def self.error__file_not_found(err)
        print("File not found: ".colorize(color: :red))
        print(err.message.split("- ").dig(1))
        print("\n")
        exit(Errno::ENOENT::Errno)
      end

      # @param file_path [String, Pathname]
      # @return [void]
      def self.backup_file(file_path)
        unless file_path.is_a?(Pathname)
          file_path = Pathname.new(file_path)
        end
        timestamp = Time.now.strftime("%Y-%m-%d_%H-%M-%S")
        FileUtils.cp(file_path, "#{file_path}.#{timestamp}.bak")
      end

      # @param file_path [String, Pathname]
      # @param content [String]
      # @param backup [Boolean]
      # @return [void]
      def self.overwrite_file(file_path, content, backup: false)
        self.backup_file(file_path) if (backup)
        File.write(file_path, (content + "\n"), mode: "w+")
      end

      # Return the current contents of standard input as a string.
      #
      # **NOTE:** This will clear `ARGV`.
      #
      # @return [String]
      def self.read_stdin()
        # binding.pry

        # return nil unless ARGF.filename == "-"
        # return nil unless STDIN.tty?()

        # $stdin << "\n"

        # s_i = IO.new(STDIN.fileno)
        # s_i.write("\n")
        # s_i.close()

        # input = ARGF.gets()
        # input = ARGF.read()

        # ARGF.each do |line|
        #   binding.pry
        #   puts "do something with this line: #{line}"
        # end

        ARGV.clear()
        input = Timeout.timeout(5) { ARGF.read() }
        return input
      end

    end
  end
end
