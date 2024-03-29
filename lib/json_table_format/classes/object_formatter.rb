module JsonTableFormat
  module Classes
    class ObjectFormatter < Processor

      # @return [Parser]
      attr_accessor :parser

      # @param parser_arg [Parser]
      # @return [void]
      def initialize(parser_arg)
        super()
        self.parser                 = parser_arg
        self.indent                 = parser_arg.indent
        self.input_json             = parser_arg.input_json
        self.top_keys               = parser_arg.top_keys
        self.keys                   = parser_arg.keys
        self.key_lengths            = parser_arg.key_lengths
        self.value_lengths          = parser_arg.value_lengths
        self.value_types            = parser_arg.value_types
        self.longest_top_key_length = parser_arg.longest_top_key_length
      end

      # @return [String]
      def format()
        output = ""
        output << "{\n"
        top_entry_count = self.input_json.keys.length
        i = 1
        self.input_json.each do |top_key, object|
          is_last_top_entry = (i == top_entry_count)
          entry_count       = self.keys.length
          top_key_string    = "\"#{top_key}\":".ljust(self.longest_top_key_length + 1, " ")
          output << (" " * self.indent) + top_key_string + " {"
          j = 1
          self.keys.each do |key|
            value_type           = self.value_types[key]
            value                = object.dig(key)
            is_last_entry        = (j == entry_count)
            longest_key_length   = self.key_lengths[key.to_s] + 1
            longest_value_length = self.value_lengths[key.to_s] + 2

            key_text = ""
            key_text << " "
            key_text << "\"#{key}\":".ljust(longest_key_length, " ")

            value_text = ""

            if value.nil?
              if value_type == Util::JsonValueType::NUMBER
                value_text << " null,".rjust(longest_value_length, " ")
              else
                value_text << " null,".ljust(longest_value_length, " ")
              end
            elsif value.is_a?(String)
              value_text << " \"#{value}\",".ljust(longest_value_length, " ")
            elsif value.is_a?(Numeric)
              value_text << " #{value},".rjust(longest_value_length, " ")
            else
              value_text << " #{value},".ljust(longest_value_length, " ")
            end

            if is_last_entry
              value_text.gsub!(/,\s*$/, "")
            end

            output << key_text
            output << value_text
            j += 1
          end

          output << (is_last_top_entry ? " }\n" : " },\n")
          i += 1
        end

        output << "}"
        return output
      end

      # @return [String]
      def pad_top_key(top_key)
        return "\"#{top_key}\": {".ljust(self.longest_top_key_length + 3, " ")
      end

    end
  end
end
