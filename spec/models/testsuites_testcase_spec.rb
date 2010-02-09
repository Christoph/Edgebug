require 'spec_helper'

describe TestsuitesTestcase do
  before(:each) do
    @valid_attributes = {
      :testsuite => ,
      :testcase_id => 
    }
  end

  it "should create a new instance given valid attributes" do
    TestsuitesTestcase.create!(@valid_attributes)
  end
end
