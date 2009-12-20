require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/testcase_results/show.html.haml" do
  include TestcaseResultsHelper
  
  before(:each) do
    assigns[:testcase_result] = @testcase_result = Factory(:testcase_result)
  end

  it "should render attributes in <p>" do
    render "/testcase_results/show.html.haml"
    response.should have_text(//)
    response.should have_text(/als/)
  end
end

