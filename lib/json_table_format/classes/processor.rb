module JsonTableFormat
  module Classes
    class Processor

      # @return [Object]
      attr_accessor :input_string
      # @return [Object]
      attr_accessor :input_json

      # @return [Integer]
      attr_accessor :element_count

      # @return [Array<String>]
      attr_accessor :keys
      # @return [Hash{String => Number}]
      attr_accessor :key_lengths
      # @return [Hash{String => Number}]
      attr_accessor :value_lengths

      # @return [Array<String>]
      attr_accessor :top_keys
      # @return [Integer]
      attr_accessor :longest_top_key_length

      # @return [Integer]
      attr_accessor :indent

      # @return [void]
      def initialize()
        self.indent                 = 2
        self.input_string           = ""
        self.input_json             = {}
        self.element_count          = 0
        self.keys                   = []
        self.key_lengths            = {}
        self.value_lengths          = {}
        self.top_keys               = []
        self.longest_top_key_length = 0
      end

    end
  end
end
