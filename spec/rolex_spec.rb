require 'spec_helper'

class TestUser
  include Rolex

  def id ; 1 ; end
end


describe Rolex do
  it 'should have a version number' do
    Rolex::VERSION.should_not be_nil
  end

  it 'should connect to redis' do
    Rolex.redis.should_not be_nil
  end
end

describe 'role methods' do
  before(:each) do
    @user = TestUser.new
  end

  it 'should have no roles if none added' do
    @user.roles.should == []
  end

  it 'should assign a role from a sym' do
    @user.add_role :admin
    @user.has_role?('admin').should be_true
  end

  it 'should assign a role from a string' do
    @user.add_role 'admin'
    @user.has_role?('admin').should be_true
  end

  it 'should return all roles as an Array' do
    @user.add_role :admin
    @user.roles.should == ['admin']
  end

  after(:each) do
    Rolex.redis.del 'user:1:rolex:test'
  end
end
