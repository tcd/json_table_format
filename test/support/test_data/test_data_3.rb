module TestData
  class TestData3

    TYPE = :object

    KEYS = [
      "id",
      "name",
      "physical",
      "elemental",
      "game_order",
    ].freeze()

    TOP_KEYS = [
      "Sword",
      "Spear",
      "Dagger",
      "Axe",
      "Bow",
      "Staff",
      "Fire",
      "Ice",
      "Lightning",
      "Wind",
      "Light",
      "Dark",
    ].freeze()

    LONGEST_TOP_KEY_LENGTH = 11

    KEY_LENGTHS = {
      "id" => 4,
      "name" => 6,
      "physical" => 10,
      "elemental" => 11,
      "game_order" => 12,
    }.freeze()

    VALUE_LENGTHS = {
      "id" => 2,
      "name" => 11,
      "physical" => 5,
      "elemental" => 5,
      "game_order" => 2,
    }.freeze()

    INPUT = '{"Sword":{"id":1,"name":"Sword","physical":true,"elemental":false,"game_order":1},"Spear":{"id":2,"name":"Spear","physical":true,"elemental":false,"game_order":2},"Dagger":{"id":3,"name":"Dagger","physical":true,"elemental":false,"game_order":3},"Axe":{"id":4,"name":"Axe","physical":true,"elemental":false,"game_order":4},"Bow":{"id":5,"name":"Bow","physical":true,"elemental":false,"game_order":5},"Staff":{"id":6,"name":"Staff","physical":true,"elemental":false,"game_order":6},"Fire":{"id":7,"name":"Fire","physical":false,"elemental":true,"game_order":7},"Ice":{"id":8,"name":"Ice","physical":false,"elemental":true,"game_order":8},"Lightning":{"id":9,"name":"Lightning","physical":false,"elemental":true,"game_order":9},"Wind":{"id":10,"name":"Wind","physical":false,"elemental":true,"game_order":10},"Light":{"id":11,"name":"Light","physical":false,"elemental":true,"game_order":11},"Dark":{"id":12,"name":"Dark","physical":false,"elemental":true,"game_order":12}}'.freeze()

    OUTPUT = <<~STR.freeze()
      {
        "Sword":     { "id":  1, "name": "Sword",     "physical": true,  "elemental": false, "game_order":  1 },
        "Spear":     { "id":  2, "name": "Spear",     "physical": true,  "elemental": false, "game_order":  2 },
        "Dagger":    { "id":  3, "name": "Dagger",    "physical": true,  "elemental": false, "game_order":  3 },
        "Axe":       { "id":  4, "name": "Axe",       "physical": true,  "elemental": false, "game_order":  4 },
        "Bow":       { "id":  5, "name": "Bow",       "physical": true,  "elemental": false, "game_order":  5 },
        "Staff":     { "id":  6, "name": "Staff",     "physical": true,  "elemental": false, "game_order":  6 },
        "Fire":      { "id":  7, "name": "Fire",      "physical": false, "elemental": true,  "game_order":  7 },
        "Ice":       { "id":  8, "name": "Ice",       "physical": false, "elemental": true,  "game_order":  8 },
        "Lightning": { "id":  9, "name": "Lightning", "physical": false, "elemental": true,  "game_order":  9 },
        "Wind":      { "id": 10, "name": "Wind",      "physical": false, "elemental": true,  "game_order": 10 },
        "Light":     { "id": 11, "name": "Light",     "physical": false, "elemental": true,  "game_order": 11 },
        "Dark":      { "id": 12, "name": "Dark",      "physical": false, "elemental": true,  "game_order": 12 }
      }
    STR

  end
end
