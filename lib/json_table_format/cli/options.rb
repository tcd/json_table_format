module JsonTableFormat
  module CLI
    # Options for the JsonTableFormat CLI
    class Options

      # INPUT_TYPES = [
      #   :stdin,
      #   :single_file,
      #   :multi_file,
      # ].freeze()

      # OUTPUT_TYPES = [
      #   :stdout,
      #   :new_file,
      #   :overwrite_file,
      # ].freeze()

      # @return [Boolean]
      attr_accessor :overwrite

      # @return [Boolean]
      attr_accessor :backup

      # @return [Symbol]
      attr_accessor :input_setting

      # @return [Symbol]
      attr_accessor :output_setting

      # @return [void]
      def initialize()
        self.overwrite = false
        self.backup = false
        self.input_setting = :stdin
        self.output_setting = :stdout
      end

    end
  end
end
