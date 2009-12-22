require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/testcase_results/new.html.haml" do
  include TestcaseResultsHelper
  
  before(:each) do
    assigns[:testcase_result] = Factory.build(:testcase_result)
  end

  it "should render new form" do
    render "/testcase_results/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", testcase_results_path)
  end
end


