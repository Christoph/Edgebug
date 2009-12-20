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

  it "should create teststeps when the step_attributes are assigned" do
    testcase = Testcase.new
    testcase.step_attributes = [{:description => "desc"}, {:description => "desc2"}]

    testcase.teststeps.length.should == 2
  end
end
