# JsonTableFormat

[![Gem](https://img.shields.io/gem/v/json_table_format)][rubygems]
[![Build Status](https://travis-ci.org/tcd/json_table_format.svg?branch=master)][travis-ci]
[![Coverage Status](https://coveralls.io/repos/github/tcd/json_table_format/badge.svg?branch=master)][coveralls]
[![License](https://img.shields.io/github/license/tcd/json_table_format)][license]
[![Documentation](http://img.shields.io/badge/docs-rubydoc.info-blue.svg)][docs]

[rubygems]: https://rubygems.org/gems/eddy
[travis-ci]: https://travis-ci.org/tcd/eddy
[coveralls]: https://coveralls.io/github/tcd/eddy?branch=master
[license]: https://github.com/tcd/eddy/blob/master/LICENSE.txt
[docs]: https://www.rubydoc.info/gems/json_table_format/0.1.0

## given this input:

```json
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
```

## produce this output:

```json
{ 
    "firstName": { "type": "string",  "description": "The person's first name." },
    "lastName":  { "type": "string",  "description": "The person's last name." },
    "age":       { "type": "integer", "description": "Age in years which must be equal to or greater than zero.", "minimum": 0 }
}
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'json_table_format'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install json_table_format

## Usage

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tcd/json_table_format.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
