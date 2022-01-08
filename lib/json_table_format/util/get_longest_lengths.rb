module JsonTableFormat
  module Util

    # # @param object [Object]
    # # @return [Integer]
    # def self.get_longest_lengths(object)
    # end

    # @param array [Array]
    # @return [Integer]
    def self.get_longest_value_lengths_for_array(array)
      result = {}
      keys = get_array_keys(array)
      array.each do |object|
        keys.each do |key|
          next unless object.key?(key)
          longest = result.dig(key)
          value   = object.dig(key)
          current = get_length(value)
          if longest.nil?
            result[key] = current
            next
          end
          if current > longest
            result[key] = current
          end
        end
      end
      return result
    end

    # @param object [Hash]
    # @return [Integer]
    def self.get_longest_value_lengths_for_object(object)
      objects = object.values()
      return get_longest_value_lengths_for_array(objects)
    end

  end
end
