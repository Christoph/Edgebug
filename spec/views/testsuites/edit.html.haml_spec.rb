require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/testsuites/edit.html.haml" do
  include TestsuitesHelper
  
  before(:each) do
    assigns[:testsuite] = @testsuite = Factory(:testsuite)
  end

  it "should render edit form" do
    render "/testsuites/edit.html.haml"
    
    response.should have_tag("form[action=#{testsuite_path(@testsuite)}][method=post]") do
      with_tag('input#testsuite_build[name=?]', "testsuite[build]")
    end
  end
end


