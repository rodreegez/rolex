require 'spec_helper'

describe Rolex do
  it 'should have a version number' do
    Rolex::VERSION.should_not be_nil
  end

  it 'connect to redis' do
    puts Rolex.redis.inspect
    Rolex.redis.should_not be_nil
  end
end
