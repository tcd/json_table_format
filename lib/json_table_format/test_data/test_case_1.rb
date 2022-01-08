module JsonTableFormat
  module TestData
    class TestCase1

      TYPE = :object

      KEYS = [
        "type",
        "description",
        "minimum",
      ].freeze()

      TOP_KEYS = [
        "firstName",
        "lastName",
        "age",
      ].freeze()

      KEY_LENGTHS = {
        type: 6,
        description: 13,
        minimum: 9,
      }.freeze()

      VALUE_LENGTHS = {
        type: 9,
        description: 59,
        minimum: 1,
      }.freeze()

      INPUT = <<~STR.gsub(/\n/, "").freeze()
        {
            "firstName": {
                "type": "string",
                "description": "The person's first name."
            },
            "lastName": {
                "type": "string",
                "description": "The person's last name."
            },
            "age": {
                "description": "Age in years which must be equal to or greater than zero.",
                "type": "integer",
                "minimum": 0
            }
        }
      STR

      OUTPUT = <<~STR.gsub(/\n/, "").freeze()
        {
          "firstName": { "type": "string",  "description": "The person's first name." },
          "lastName":  { "type": "string",  "description": "The person's last name." },
          "age":       { "type": "integer", "description": "Age in years which must be equal to or greater than zero.", "minimum": 0 }
        }
      STR

    end
  end
end
