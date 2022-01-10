module TestData
  class TestData1

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

    LONGEST_TOP_KEY_LENGTH = 11

    KEY_LENGTHS = {
      "type" => 6,
      "description" => 13,
      "minimum" => 9,
    }.freeze()

    VALUE_LENGTHS = {
      "type" => 9,
      "description" => 59,
      "minimum" => 4,
    }.freeze()

    INPUT = <<~STR.freeze()
      {
          "firstName": {
              "type": "string",
              "description": "The person's first name.",
              "minimum": null
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

    OUTPUT = <<~STR.gsub(/\n\z/, "").freeze()
      {
        "firstName": { "type": "string",  "description": "The person's first name.",                                  "minimum": null },
        "lastName":  { "type": "string",  "description": "The person's last name.",                                   "minimum": null },
        "age":       { "type": "integer", "description": "Age in years which must be equal to or greater than zero.", "minimum":    0 }
      }
    STR

  end
end
