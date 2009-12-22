require 'spec_helper'

describe TeststepResult do
  before(:each) do
    @valid_attributes = {
      :teststep_id => 1,
      :result => false
    }
  end

  it "should create a new instance given valid attributes" do
    TeststepResult.create!(@valid_attributes)
  end
end
