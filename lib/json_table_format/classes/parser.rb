module JsonTableFormat
  module Classes
    # Collects information required for formatting
    class Parser < Processor

      # @return [{:array, :object, :other}]
      attr_accessor :json_data_type

      # @return [Boolean]
      attr_accessor :is_invalid

      # @param input_string [String]
      # @return [void]
      def initialize(input_string)
        super()
        self.is_invalid = false
        self.json_data_type = Util::JsonDataType::OTHER
        self.input_string = input_string
      end

      # @return [void]
      def _parse_json()
        begin
          json = JSON.parse(self.input_string)
          self.input_json = json
        rescue StandardError => e
          puts(e)
          self.is_invalid = true
          return nil
        end

      end

    end
  end
end
