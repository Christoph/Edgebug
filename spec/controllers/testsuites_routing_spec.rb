require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TestsuitesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "testsuites", :action => "index").should == "/testsuites"
    end
  
    it "should map #new" do
      route_for(:controller => "testsuites", :action => "new").should == "/testsuites/new"
    end
  
    it "should map #show" do
      route_for(:controller => "testsuites", :action => "show", :id => '1').should == "/testsuites/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "testsuites", :action => "edit", :id => '1').should == "/testsuites/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "testsuites", :action => "update", :id => '1').should == { :path => "/testsuites/1", :method => :put }
    end
  
    it "should map #destroy" do
      route_for(:controller => "testsuites", :action => "destroy", :id => '1').should == { :path => "/testsuites/1", :method => :delete }
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/testsuites").should == {:controller => "testsuites", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/testsuites/new").should == {:controller => "testsuites", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/testsuites").should == {:controller => "testsuites", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/testsuites/1").should == {:controller => "testsuites", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/testsuites/1/edit").should == {:controller => "testsuites", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/testsuites/1").should == {:controller => "testsuites", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/testsuites/1").should == {:controller => "testsuites", :action => "destroy", :id => "1"}
    end
  end
end
