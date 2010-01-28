require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tags/show.html.haml" do
  include TagsHelper
  
  before(:each) do
    assigns[:tag] = @tag = Factory(:tag)
  end

  it "should render attributes in <p>" do
    render "/tags/show.html.haml"
    response.should have_text(/value\ for\ name/)
  end
end

