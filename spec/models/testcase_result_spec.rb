require 'spec_helper'

describe TestcaseResult do
  before(:each) do
    @valid_attributes = {
      :testcase_id => 2,
      :result => false
    }
  end

  it "should create a new instance given valid attributes" do
    TestcaseResult.create!(@valid_attributes)
  end
end
