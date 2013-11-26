class Redis
  def self.current
    @_current ||= Redis.connect(:url => 'redis://localhost:6379/1')
  end
end
