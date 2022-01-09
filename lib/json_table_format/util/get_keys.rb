module JsonTableFormat
  module Util

    # @param target [Array<Hash>]
    # @return [Array<String>]
    def self.get_array_keys(target)
      return target.flat_map(&:keys).uniq()
    rescue StandardError => e
      puts("JsonTableFormat::Util.get_array_keys() - error:", e)
      return []
    end

    # @param target [Hash<String, Hash>]
    # @return [Array<String>]
    def self.get_object_keys(target)
      return target.values.flat_map(&:keys).uniq()
    rescue StandardError => e
      puts("JsonTableFormat::Util.get_object_keys() - error:", e)
      return []
    end

  end
end
