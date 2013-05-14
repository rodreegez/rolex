require "rolex/version"
require "redis/namespace"

# ROLEX - Redis backed roles

module Rolex

  #
  # Lifted directly from Split: https://github.com/andrew/split/blob/master/lib/split.rb#L12-L37
  #
  # Accepts:
  #   1. A 'hostname:port' string
  #   2. A 'hostname:port:db' string (to select the Redis db)
  #   3. A 'hostname:port/namespace' string (to set the Redis namespace)
  #   4. A redis URL string 'redis://host:port'
  #   5. An instance of `Redis`, `Redis::Client`, `Redis::DistRedis`,
  #      or `Redis::Namespace`.
  def self.redis=(server)
    if server.respond_to? :split
      if server["redis://"]
        redis = Redis.connect(:url => server, :thread_safe => true)
      else
        server, namespace = server.split('/', 2)
        host, port, db = server.split(':')
        redis = Redis.new(:host => host, :port => port,
          :thread_safe => true, :db => db)
      end
      namespace ||= :rolex

      @redis = Redis::Namespace.new(namespace, :redis => redis)
    elsif server.respond_to? :namespace=
      @redis = server
    else
      @redis = Redis::Namespace.new(:rolex, :redis => server)
    end
  end

  # Returns the current Redis connection. If none has been created, will
  # create a new one.
  def self.redis
    return @redis if @redis
    self.redis = 'localhost:6379'
    self.redis
  end

  extend ActiveSupport::Concern

  SUFFIX = ENV['RAILS_ENV'] || 'development'

  included do
    def add_role(role)
      Rolex.redis.sadd "user:#{id}:rolex:#{SUFFIX}", role.to_s
    end

    def has_role?(role)
      Rolex.redis.smembers("user:#{id}:rolex:#{SUFFIX}").include? role.to_s
    end

    def roles
      Rolex.redis.smembers("user:#{id}:rolex:#{SUFFIX}")
    end

    def remove_role(role)
      Rolex.redis.srem "user:#{id}:rolex:#{SUFFIX}", role.to_s
    end
  end
end
