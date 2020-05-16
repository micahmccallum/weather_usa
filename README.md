# WeatherUsa

WeatherUsa is a gem that with a zip code or a city and state combination returns the weather information from the weather.gov API for the United States of America and displays the formatted information to the console. After the initial search, current conditions are shown, along with any weather alerts.  There are also options for seeing more detailed forecasts or searching for another location.  Try it out!
Please note:  At times there are issues with the API servers' response and at this time I have not included any way to handle these.  This will be looked at in a future release.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'weather_usa'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install weather_usa

## Usage

After starting the program, just follow the onscreen menu; it is very self-guided.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/weather_usa. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/weather_usa/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WeatherUsa project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/weather_usa/blob/master/CODE_OF_CONDUCT.md).
