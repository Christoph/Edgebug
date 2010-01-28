require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/tags/edit.html.haml" do
  include TagsHelper
  
  before(:each) do
    assigns[:tag] = @tag = Factory(:tag)
  end

  it "should render edit form" do
    render "/tags/edit.html.haml"
    
    response.should have_tag("form[action=#{tag_path(@tag)}][method=post]") do
      with_tag('input#tag_name[name=?]', "tag[name]")
    end
  end
end


