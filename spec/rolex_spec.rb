require 'spec_helper'

describe Rolex do
  it 'should have a version number' do
    Rolex::VERSION.should_not be_nil
  end

  it 'should do something useful' do
    true.should be_true
  end
end
