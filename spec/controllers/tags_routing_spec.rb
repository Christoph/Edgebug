require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TagsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "tags", :action => "index").should == "/tags"
    end
  
    it "should map #new" do
      route_for(:controller => "tags", :action => "new").should == "/tags/new"
    end
  
    it "should map #show" do
      route_for(:controller => "tags", :action => "show", :id => '1').should == "/tags/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "tags", :action => "edit", :id => '1').should == "/tags/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "tags", :action => "update", :id => '1').should == { :path => "/tags/1", :method => :put }
    end
  
    it "should map #destroy" do
      route_for(:controller => "tags", :action => "destroy", :id => '1').should == { :path => "/tags/1", :method => :delete }
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/tags").should == {:controller => "tags", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/tags/new").should == {:controller => "tags", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/tags").should == {:controller => "tags", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/tags/1").should == {:controller => "tags", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/tags/1/edit").should == {:controller => "tags", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/tags/1").should == {:controller => "tags", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/tags/1").should == {:controller => "tags", :action => "destroy", :id => "1"}
    end
  end
end
