module JsonTableFormat
  module Util
    # Determines how JSON values are formatted
    class JsonValueType
      OTHER   = :other
      NULL    = :null
      BOOLEAN = :boolean
      STRING  = :string
      NUMBER  = :number
    end
  end
end
