# Ceifpar [![Build Status](https://travis-ci.org/unasuke/ceifpar.svg)](https://travis-ci.org/unasuke/ceifpar)

Ceifpar is the ruby script to conceal(clear) exif info from photo and resize it.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ceifpar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ceifpar

## Usage
```shell
#delete exif information and resize image to half
$ ceifpar -r 1/2 hoge.jpg
$ ceifpar -r 0.5 hoge.jpg
$ ceifpar -r 50% hoge.jpg

#delete exif information only
$ ceifpar hoge.jpg
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/unasuke/ceifpar.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

