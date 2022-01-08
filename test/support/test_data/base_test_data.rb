require "json"

module TestData
  class BaseTestData

    # @return [Object]
    attr_accessor :input_string
    # @return [Object]
    attr_accessor :input_json

    # @return [Integer]
    attr_accessor :element_count

    # @return [Array<String>]
    attr_accessor :keys
    # @return [Hash{String => Number}]
    attr_accessor :key_lengths
    # @return [Hash{String => Number}]
    attr_accessor :value_lengths

    # @return [Array<String>]
    attr_accessor :top_keys
    # @return [Integer]
    attr_accessor :longest_top_key_length

  end
end
