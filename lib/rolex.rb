require "rolex/version"

# ROLEX - Redis backed roles

module Rolex
  extend ActiveSupport::Concern

  included do
    def add_role(role)
      Redis.current.sadd "user:#{id}:rolex:#{ENV['RAILS_ENV']}", role.to_s
    end

    def has_role?(role)
      Redis.current.smembers("user:#{id}:rolex:#{ENV['RAILS_ENV']}").include? role.to_s
    end

    def roles
      Redis.current.smembers("user:#{id}:rolex:#{ENV['RAILS_ENV']}")
    end
  end
end
