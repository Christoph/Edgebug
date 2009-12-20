require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/teststep_results/show.html.haml" do
  include TeststepResultsHelper
  
  before(:each) do
    assigns[:teststep_result] = @teststep_result = Factory(:teststep_result)
  end

  it "should render attributes in <p>" do
    render "/teststep_results/show.html.haml"
    response.should have_text(//)
    response.should have_text(/als/)
  end
end

