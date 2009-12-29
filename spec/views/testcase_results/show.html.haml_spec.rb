require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/testcase_results/show.html.haml" do
  include TestcaseResultsHelper
  
  before(:each) do
    @testcase = Factory(:testcase)
    @testcase_result = Factory(:testcase_result)
    @testcase_result.testcase = @testcase
    
    assigns[:testcase_result] = @testcase_result
  end

  it "should render attributes in <p>" do
    render "/testcase_results/show.html.haml"
    response.should have_text(/Testcase/)
    response.should have_text(/Result/)
  end

  it "should render the testcase title as h1" do
    render "/testcase_results/show.html.haml"

    response.should have_tag("h1", /#{@testcase.title}/)
  end
end

