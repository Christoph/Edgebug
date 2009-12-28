require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/testcases/show.html.haml" do
  include TestcasesHelper
  
  before(:each) do
    assigns[:testcase] = @testcase = Factory(:testcase)
  end

  it "should render attributes in h1" do
    render "/testcases/show.html.haml"
    response.should have_tag("h1", @testcase.title)
  end
end

