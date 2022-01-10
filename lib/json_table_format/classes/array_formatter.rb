module JsonTableFormat
  module Classes
    class ArrayFormatter < Processor

      # @return [Parser]
      attr_accessor :parser

      # @param parser_arg [Parser]
      # @return [void]
      def initialize(parser_arg)
        super()
        self.parser        = parser_arg
        self.indent        = parser_arg.indent
        self.input_json    = parser_arg.input_json
        self.top_keys      = parser_arg.top_keys
        self.keys          = parser_arg.keys
        self.key_lengths   = parser_arg.key_lengths
        self.value_lengths = parser_arg.value_lengths
      end

      # @return [String]
      def format()
        output = ""
        output << "[\n"
        top_entry_count = self.input_json.length
        self.input_json.each_with_index do |object, i|
          is_last_top_entry = ((i + 1) == top_entry_count)
          entry_count       = self.keys.length
          output << (" " * self.indent) + "{"
          j = 1
          self.keys.each do |key|
            value                = object.dig(key)
            is_last_entry        = (j == entry_count)
            longest_key_length   = self.key_lengths[key.to_s] + 1
            longest_value_length = self.value_lengths[key.to_s] + 2

            key_text = ""
            key_text << " "
            key_text << "\"#{key}\":".ljust(longest_key_length, " ")

            value_text = ""

            if value.nil?
              value_text << " null,".ljust(longest_value_length, " ")
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
        end

        output << "]"
        return output
      end

    end
  end
end
