require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/testsuites/show.html.haml" do
  include TestsuitesHelper
  
  before(:each) do
    assigns[:testsuite] = @testsuite = Factory(:testsuite)
  end

  it "should render attributes in <p>" do
    render "/testsuites/show.html.haml"
    response.should have_text(/value\ for\ build/)
  end
end

