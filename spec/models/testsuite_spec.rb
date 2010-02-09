require 'spec_helper'

describe Testsuite do
  before(:each) do
    @valid_attributes = {
      :build => "value for build"
    }
  end

  it "should create a new instance given valid attributes" do
    Testsuite.create!(@valid_attributes)
  end
end
