require 'spec_helper'

describe Testcase do
  before(:each) do
    @valid_attributes = {
      :title => "value for title"
    }
  end

  it "should create a new instance given valid attributes" do
    Testcase.create!(@valid_attributes)
  end
end
