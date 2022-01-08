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
        self._parse_json()
      end

      # @return [void]
      def _parse_json()
        begin
          json = JSON.parse(self.input_string)
          self.input_json = json
        rescue StandardError => e
          binding.pry
          self.is_invalid = true
          return nil
        end

        self.json_data_type = Util.determine_json_data_type(self.input_json)

        return nil unless self.valid?()

      end

      # @return [Boolean]
      def valid?()
        return false if self.is_invalid == true
        return false if self.json_data_type == Util::JsonDataType::OTHER

        return true if self.json_data_type == Util::JsonDataType::ARRAY
        return true if self.json_data_type == Util::JsonDataType::OBJECT

        return false
      end

    end
  end
end
