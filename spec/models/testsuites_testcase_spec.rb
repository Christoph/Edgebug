require 'spec_helper'

describe TestsuitesTestcase do
  before(:each) do
    @valid_attributes = {
      :testsuite_id => 0,
      :testcase_id => 0
    }
  end

  it "should create a new instance given valid attributes" do
    TestsuitesTestcase.create!(@valid_attributes)
  end
end
