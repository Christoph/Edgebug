require 'spec_helper'

describe Step do
  before(:each) do
    @valid_attributes = {
      :description => "value for description",
      :Testcase => Testcase.new
    }
  end

  it "should create a new instance given valid attributes" do
    Step.create!(@valid_attributes)
  end
end
