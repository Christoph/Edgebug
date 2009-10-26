require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/testcases/index.html.haml" do
  include TestcasesHelper
  
  before(:each) do
     assigns[:testcases] = [ Factory(:testcase), Factory(:testcase), Factory(:testcase) ]
  end

  it "should render list of testcases" do
    render "/testcases/index.html.haml"
    response.should have_tag("div>div", "value for title", 2)
  end
end

