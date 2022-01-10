module JsonTableFormat
  module Util

    # Returns a symbol describing the type of an object.
    #
    # @param object [Object]
    # @return [Symbol]
    def self.determine_json_value_type(object)
      return JsonValueType::OTHER if object.is_a?(Hash)
      return JsonValueType::OTHER if object.is_a?(Array)

      return JsonValueType::NULL if object.nil?()

      return JsonValueType::BOOLEAN if object.class == TrueClass
      return JsonValueType::BOOLEAN if object.class == FalseClass

      return JsonValueType::STRING if object.is_a?(String)

      return JsonValueType::NUMBER if object.is_a?(Numeric)

      return JsonValueType::OTHER
    end

    # @param array [Array]
    # @return [Hash]
    def self.determine_json_value_types_for_array(array)
      result = {}
      array.each do |object|
        object.each do |key, value|
          next if value.nil?()
          current = result[key]
          next unless current.nil?
          result[key] = determine_json_value_type(value)
        end
      end
      return result
    end

    # @param object [Hash]
    # @return [Hash]
    def self.determine_json_value_types_for_object(object)
      array = object.values()
      return determine_json_value_types_for_array(array)
    end

  end
end
