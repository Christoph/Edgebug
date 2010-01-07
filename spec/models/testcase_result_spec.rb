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
  
  it "should create teststep_results when getting the attributes" do
    testcase = TestcaseResult.create!(@valid_attributes)

    testcase.teststep_result_attributes = [{"result" => "t", "teststep_id" => "1"}, {"result" => "f", "teststep_id" => "2"}]

    testcase.teststep_results.length.should == 2
    first_result = testcase.teststep_results[0]
    first_result.teststep_id.should == 1
    first_result.result.should be_true

    second_result = testcase.teststep_results[1]
    second_result.teststep_id.should == 2
    second_result.result.should be_false
  end

  it "should save the overall result when getting the attributes" do
    testcase = TestcaseResult.create!(@valid_attributes)

    testcase.teststep_result_attributes = [{"result" => "t", "teststep_id"=>"1"}]

    testcase.result.should be_true
  end

  it "should set the result to failed if one step is pending" do
    testcase = TestcaseResult.create!(@valid_attributes)

    testcase.teststep_result_attributes = [{"result" => "t", "teststep_id" => "1"}, {"result" => "", "teststep_id" => "2"}]

    testcase.result.should be_false
  end
end
