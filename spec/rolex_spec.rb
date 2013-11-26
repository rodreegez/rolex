require 'spec_helper'

class TestUser
  include Rolex

  def id ; 1 ; end
end


describe Rolex do
  it 'should have a version number' do
    Rolex::VERSION.should_not be_nil
  end

  it 'connect to redis' do
    Rolex.redis.should_not be_nil
  end

  it 'should assign a role' do
    user = TestUser.new
    user.add_role :admin

    user.has_role?('admin').should be_true
  end

  after(:each) do
    Rolex.redis.del 'rolex-test:*'
  end
end
