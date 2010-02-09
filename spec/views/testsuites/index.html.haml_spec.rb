require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/testsuites/index.html.haml" do
  include TestsuitesHelper
  
  before(:each) do
    assigns[:testsuites] = [ Factory(:testsuite), Factory(:testsuite) ]
  end

  it "should render list of testsuites" do
    render "/testsuites/index.html.haml"
    response.should have_tag("tr>td", "value for build", 2)
  end
end

