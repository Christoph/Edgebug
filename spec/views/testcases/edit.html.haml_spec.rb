require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/testcases/edit.html.haml" do
  include TestcasesHelper
  
  before(:each) do
    assigns[:testcase] = @testcase = Factory(:testcase)
  end

  it "should render edit form" do
    render "/testcases/edit.html.haml"
    
    response.should have_tag("form[action=#{testcase_path(@testcase)}][method=post]") do
      with_tag('input#testcase_title[name=?]', "testcase[title]")
    end
  end
end


