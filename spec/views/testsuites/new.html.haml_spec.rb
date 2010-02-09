require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/testsuites/new.html.haml" do
  include TestsuitesHelper
  
  before(:each) do
    assigns[:testsuite] = Factory.build(:testsuite)
  end

  it "should render new form" do
    render "/testsuites/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", testsuites_path) do
      with_tag("input#testsuite_build[name=?]", "testsuite[build]")
    end
  end
end


