require 'spec_helper'

describe TestcaseResultsTestsuites do
  before(:each) do
    @valid_attributes = {
      :testcase_result_id => ,
      :testsuite_id => 
    }
  end

  it "should create a new instance given valid attributes" do
    TestcaseResultsTestsuites.create!(@valid_attributes)
  end
end
