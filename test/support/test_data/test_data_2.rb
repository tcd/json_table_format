module TestData
  class TestData2

    TYPE = :array

    KEYS = [
      "type",
      "description",
      "required",
      "optional",
      "minimum",
      "maximum",
    ].freeze()

    KEY_LENGTHS = {
      "type" => 6,
      "description" => 13,
      "required" => 10,
      "optional" => 10,
      "minimum" => 9,
      "maximum" => 9,
    }.freeze()

    VALUE_LENGTHS = {
      "type" => 9,
      "description" => 59,
      "required" => 5,
      "optional" => 5,
      "minimum" => 1,
      "maximum" => 1,
    }.freeze()

    INPUT = <<~STR.freeze()
      [
          {
              "type": "string",
              "description": "The person's first name.",
              "required": true,
              "optional": false
          },
          {
              "type": "integer",
              "description": "Age in years which must be equal to or greater than zero.",
              "required": false,
              "optional": true,
              "minimum": 0
          },
          {
              "type": "string",
              "description": "The person's last name.",
              "required": true,
              "optional": false
          },
          {
              "type": "integer",
              "description": "Favorite number",
              "required": true,
              "optional": true,
              "maximum": 0
          }
      ]
    STR

    OUTPUT = <<~STR.gsub(/\n\z/, "").freeze()
      [
        { "type": "string",  "description": "The person's first name.",                                  "required": true,  "optional": false, "minimum": null, "maximum": null },
        { "type": "integer", "description": "Age in years which must be equal to or greater than zero.", "required": false, "optional": true,  "minimum":    0, "maximum": null },
        { "type": "string",  "description": "The person's last name.",                                   "required": true,  "optional": false, "minimum": null, "maximum": null },
        { "type": "integer", "description": "Favorite number",                                           "required": true,  "optional": true,  "minimum": null, "maximum":    0 }
      ]
    STR

  end
end
