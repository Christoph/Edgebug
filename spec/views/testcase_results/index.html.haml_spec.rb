require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/testcase_results/index.html.haml" do
  include TestcaseResultsHelper
  
  before(:each) do
    assigns[:testcase_results] = [ Factory(:testcase_result), Factory(:testcase_result) ]
  end

  it "should render list of testcase_results" do
    render "/testcase_results/index.html.haml"
    response.should have_tag("tr>td", true, 2)
    response.should have_tag("tr>td", true, 2)
  end
end

