require 'spec_helper'

describe Teststep do
  before(:each) do
    @valid_attributes = {
      :description => "value for description",
      :testcase => Testcase.new
    }
  end

  it "should create a new instance given valid attributes" do
    Teststep.create!(@valid_attributes)
  end
end
