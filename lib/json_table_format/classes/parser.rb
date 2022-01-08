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
        self.parse_json()
      end

      # @return [void]
      def parse_json()
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

        case self.json_data_type
        when Util::JsonDataType::ARRAY  then self.parse_array()
        when Util::JsonDataType::OBJECT then self.parse_object()
        end

        return nil
      end

      # @return [Boolean]
      def valid?()
        return false if self.is_invalid == true
        return false if self.json_data_type == Util::JsonDataType::OTHER

        return true if self.json_data_type == Util::JsonDataType::ARRAY
        return true if self.json_data_type == Util::JsonDataType::OBJECT

        return false
      end

      # @return [void]
      def parse_array()
        self.keys          = self.input_json.flat_map(&:keys).uniq()
        self.key_lengths   = {}
        self.value_lengths = {}
      end

      # @return [void]
      def parse_object()
        self.keys                   = self.input_json.values.flat_map(&:keys).uniq()
        self.key_lengths            = {}
        self.value_lengths          = {}
        self.top_keys               = self.input_json.keys().uniq()
        self.longest_top_key_length = 0
      end

    end
  end
end
