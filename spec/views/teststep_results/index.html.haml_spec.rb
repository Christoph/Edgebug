require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/teststep_results/index.html.haml" do
  include TeststepResultsHelper
  
  before(:each) do
    assigns[:teststep_results] = [ Factory(:teststep_result), Factory(:teststep_result) ]
  end

  it "should render list of teststep_results" do
    render "/teststep_results/index.html.haml"
    response.should have_tag("tr>td", , 2)
    response.should have_tag("tr>td", false, 2)
  end
end

