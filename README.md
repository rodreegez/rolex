# Rolex

Redis-backed roles for Rails applications

Include Rolex into your model:

    class User < ActiveRecord::Base
      include Rolex
    end

Then:

    > user.add_role :admin
    => true

    > user.has_role? :admin
    => true

    > user.roles
    => ['roles']

Roles are unique - if in doubt, add it.

A model can have as many roles as you like.

Roles can be anything you like.

## TODO

Add tests!

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
