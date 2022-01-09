module JsonTableFormat
  module Util

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

    # @param keys [Array<String>]
    # @return [Hash<String, Integer>]
    def self.get_key_lengths(keys)
      result = {}
      keys.each { |x| result[x] = (x.length + 2) } # they're all strings, add two for when they're quoted
      return result
      # keys.reduce({}) { |total, current| total.merge({ current => (current.length + 2) }) }
      # return keys.reduce({}) { |x, y| x.merge({ y => (y.length + 2) }) }
    end

  end
end
