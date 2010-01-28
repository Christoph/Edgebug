require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tags/new.html.haml" do
  include TagsHelper
  
  before(:each) do
    assigns[:tag] = Factory.build(:tag)
  end

  it "should render new form" do
    render "/tags/new.html.haml"
    
    response.should have_tag("form[action=?][method=post]", tags_path) do
      with_tag("input#tag_name[name=?]", "tag[name]")
    end
  end
end


