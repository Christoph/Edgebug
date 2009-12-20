require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/testcase_results/edit.html.haml" do
  include TestcaseResultsHelper
  
  before(:each) do
    assigns[:testcase_result] = @testcase_result = Factory(:testcase_result)
  end

  it "should render edit form" do
    render "/testcase_results/edit.html.haml"
    
    response.should have_tag("form[action=#{testcase_result_path(@testcase_result)}][method=post]") do
      with_tag('input#testcase_result_testcase[name=?]', "testcase_result[testcase]")
      with_tag('input#testcase_result_result[name=?]', "testcase_result[result]")
    end
  end
end


