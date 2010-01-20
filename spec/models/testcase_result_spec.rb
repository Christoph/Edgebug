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

  describe "update_result" do
    it "should set the result to true if all step results are true" do
      testcase = TestcaseResult.create!(@valid_attributes)
      testcase.teststep_results = [Factory(:teststep_result, :result => true)]

      testcase.update_result

      testcase.result.should be_true
    end

    it "should set the result to failed if one step is pending" do
      testcase = TestcaseResult.create!(@valid_attributes)

      testcase.teststep_results = [Factory(:teststep_result, :result => true),
        Factory(:teststep_result, :result => nil)]

      testcase.update_result

      testcase.result.should be_false
    end

    it "should set the result to failed if one step result is false" do
      testcase = TestcaseResult.create!(@valid_attributes)

      testcase.teststep_results = [Factory(:teststep_result, :result => true),
        Factory(:teststep_result, :result => false)]

      testcase.update_result

      testcase.result.should be_false
    end
  end
end
