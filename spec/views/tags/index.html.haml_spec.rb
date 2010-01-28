require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tags/index.html.haml" do
  include TagsHelper
  
  before(:each) do
    assigns[:tags] = [ Factory(:tag), Factory(:tag) ]
  end

  it "should render list of tags" do
    render "/tags/index.html.haml"
    response.should have_tag("tr>td", "value for name", 2)
  end
end

