require "rolex/version"

# ROLEX - Redis backed roles

module Rolex
  extend ActiveSupport::Concern

  SUFFIX = ENV['RAILS_ENV'] || 'development'

  included do
    def add_role(role)
      Redis.current.sadd "user:#{id}:rolex:#{SUFFIX}", role.to_s
    end

    def has_role?(role)
      Redis.current.smembers("user:#{id}:rolex:#{SUFFIX}").include? role.to_s
    end

    def roles
      Redis.current.smembers("user:#{id}:rolex:#{SUFFIX}")
    end

    def remove_role(role)
      Redis.current.srem "user:#{id}:rolex:#{SUFFIX}", role.to_s
    end
  end
end
