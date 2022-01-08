module TestData
  class TestData0

    # @return [Symbol]
    TYPE = :other

    # @return [Array<String>]
    KEYS = [].freeze()

    # @return [Array<String>]
    TOP_KEYS = [].freeze()

    # @return [Hash<Symbol, Integer>]
    KEY_LENGTHS = {}.freeze()

    # @return [Hash<Symbol, Integer>]
    VALUE_LENGTHS = {}.freeze()

    # @return [String]
    INPUT = <<~STR.gsub(/\n/, "").freeze()
    STR

    # @return [String]
    OUTPUT = <<~STR.gsub(/\n/, "").freeze()
    STR

  end
end
