# Sellsy

A ruby API client for Sellsy.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sellsy'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sellsy

## Getting started

First, set the credentials, if you use Rails, you can do this in an initializer.

```ruby
Sellsy.default_client_id = "<your client id>"
Sellsy.default_secret_id = "<your secret>"
```

Then, you can use Sellsy singleton to make requests:

```ruby
# List the account invoices
Sellsy.invoices.list
```

Or you can create a sellsy client yourself:

```ruby
sellsy = Sellsy::Client.new(client_id: "<your client id>", client_secret: "<your secret>")

sellsy.invoices.list
```

If you need more information on supported requests, please check the code directly then share
your discoveries in this documentation.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thepackengers/sellsy. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## Code of Conduct

Everyone interacting in the Sellsy project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/thepackengers/sellsy/blob/master/CODE_OF_CONDUCT.md).
