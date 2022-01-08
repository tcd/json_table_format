module JsonTableFormat
  module Classes
    class ObjectFormatter < Processor

      # @return [Parser]
      attr_accessor :parser

      # @param parser [Parser]
      # @return [void]
      def initialize(parser)
        super()
        self.parser = parser
      end

      # @return [String]
      def format()

      end

    end
  end
end
