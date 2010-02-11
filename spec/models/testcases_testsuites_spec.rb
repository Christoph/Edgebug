require 'spec_helper'

describe TestcasesTestsuites do
  before(:each) do
    @valid_attributes = {
      :testsuite_id => 0,
      :testcase_id => 0
    }
  end

  it "should create a new instance given valid attributes" do
    TestcasesTestsuites.create!(@valid_attributes)
  end
end
