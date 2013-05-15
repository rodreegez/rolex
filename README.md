# Rolex

Redis-backed roles for Rails applications.

## To use in a Rails application

Create an initializer:

    Rolex.redis = (Redis.current || ENV['REDISTOGO_URL'] || whatever)

Include Rolex into your model:

    class User < ActiveRecord::Base
      include Rolex
    end

Then:

    > user.add_role 'admin'
    => true

    > user.has_role? 'admin'
    => true

    > user.roles
    => ['admin']

Roles are unique - if in doubt, add it.

A model can have as many roles as you like.

Roles can be anything you like.

Because Redis deals in strings, but you may wish to use symbols to indicate roles...

    > user.add_role 'admin'

...is treated as equivalent to:

    > user.add_role :admin

The result of:

    > user.roles

Will always be an Array. Any roles present will always be strings.

## TODO

* Add tests!
* Configure Redis properly (currently relies on how I like to define Redis in my Rails apps)
* Make framework agnostic

## Installation

Add this line to your application's Gemfile:

    gem 'rolex'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rolex

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
