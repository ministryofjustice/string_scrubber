# StringScrubber

[![Code
Climate](https://codeclimate.com/github/ministryofjustice/string_scrubber/badges/gpa.svg)](https://codeclimate.com/github/ministryofjustice/string_scrubber)
[![Circle
CI](https://circleci.com/gh/ministryofjustice/string_scrubber.svg?style=svg)](https://circleci.com/gh/ministryofjustice/string_scrubber)


This gem prevents #to_json calls from raising exceptions on strings that
are not UTF-8 encoded. It was written to deal with logging failures in the
[logstasher](https://github.com/shadabahmed/logstasher) gem.

The exceptions were `JSON::GeneratorError` and
`Encoding::UndefinedConversionError` and occurred when trying to log
controller parameters that contained ASCII-8BIT strings.  You can
reproduce these errors on a running app using the following `curl`
command:

```bash
curl -i -X GET "http://localhost:3000/tests" -d $'param=a\xE2a'
```

See the specs for a typical example string.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'MoJ_IRAT_string_scrubber'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install MoJ_IRAT_string_scrubber

## Usage

Install it.  It does the rest.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/MoJ_IRAT_string_scrubber.

