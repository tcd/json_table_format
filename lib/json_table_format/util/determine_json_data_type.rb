module JsonTableFormat
  module Util

    # @param json [Hash]
    # @return [Symbol]
    def self.determine_json_data_type(json)
      return JsonDataType::OTHER  if JSON.generate(json) == "{}"
      return JsonDataType::ARRAY  if _is_json_array(json)
      return JsonDataType::OBJECT if _is_json_object_array(json)
      return JsonDataType::OTHER
    end

    # @param json [Hash]
    # @return [Boolean]
    def self._is_json_array(json)
      return false unless json.is_a?(Array)
      return false if json.any? { |x| !x.is_a?(Hash) }
      return true
    end

    # @param json [Hash]
    # @return [Boolean]
    def self._is_json_object_array(json)
      return false if json.is_a?(Array)
      return false if json.values.map(&:values).any? { |x| x.is_a?(Hash) }
      return true
    end

    # # @param x [Object]
    # # @return [Boolean]
    # def self._is_object(x)
    #   return false if x.nil?()
    #   return false if x.is_a?(Array)
    #   return false if x.is_a?(String)
    #   return false if x.is_a?(Numeric)
    #   return false if (x.class == TrueClass || x.class == FalseClass)

    #   return true
    # end

    # # @param x [Object]
    # # @return [Boolean]
    # def self._is_measurable(x)
    #   return false
    # end

  end
end
