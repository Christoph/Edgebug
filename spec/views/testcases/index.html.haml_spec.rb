require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/testcases/index.html.haml" do
  include TestcasesHelper
  
  before(:each) do
    @testcases = [ Factory(:testcase), Factory(:testcase), Factory(:testcase) ]
    assigns[:testcases] = @testcases
  end

  it "should render list of testcases" do
    render "/testcases/index.html.haml"
    response.should have_tag("div>div>a", @testcases[0].title, 2)
  end
end

