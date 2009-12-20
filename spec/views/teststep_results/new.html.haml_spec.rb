require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/teststep_results/new.html.haml" do
  include TeststepResultsHelper
  
  before(:each) do
    assigns[:teststep_result] = Factory.build(:teststep_result)
  end

  it "should render new form" do
    render "/teststep_results/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", teststep_results_path) do
      with_tag("input#teststep_result_teststep[name=?]", "teststep_result[teststep]")
      with_tag("input#teststep_result_result[name=?]", "teststep_result[result]")
    end
  end
end


