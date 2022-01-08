module JsonTableFormat
  module Util

    # Returns the length of a value when represented in JSON.
    #
    # @param object [Object]
    # @return [Integer]
    def self.get_length(object)
      return -1 if object.is_a?(Hash)
      return -1 if object.is_a?(Array)

      return 4 if object.nil?()

      return 4 if object.class == TrueClass
      return 5 if object.class == FalseClass

      return object.length + 2 if object.is_a?(String)

      return object.to_s.length if object.is_a?(Numeric)

      return -1
    end

  end
end
