require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/testcases/new.html.haml" do
  include TestcasesHelper
  
  before(:each) do
    assigns[:testcase] = Factory.build(:testcase)
  end

  it "should render new form" do
    render "/testcases/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", testcases_path) do
      with_tag("input#testcase_title[name=?]", "testcase[title]")
    end
  end
end


