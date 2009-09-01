require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TestcasesController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "testcases", :action => "index").should == "/testcases"
    end
  
    it "should map #new" do
      route_for(:controller => "testcases", :action => "new").should == "/testcases/new"
    end
  
    it "should map #show" do
      route_for(:controller => "testcases", :action => "show", :id => '1').should == "/testcases/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "testcases", :action => "edit", :id => '1').should == "/testcases/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "testcases", :action => "update", :id => '1').should == { :path => "/testcases/1", :method => :put }
    end
  
    it "should map #destroy" do
      route_for(:controller => "testcases", :action => "destroy", :id => '1').should == { :path => "/testcases/1", :method => :delete }
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/testcases").should == {:controller => "testcases", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/testcases/new").should == {:controller => "testcases", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/testcases").should == {:controller => "testcases", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/testcases/1").should == {:controller => "testcases", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/testcases/1/edit").should == {:controller => "testcases", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/testcases/1").should == {:controller => "testcases", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/testcases/1").should == {:controller => "testcases", :action => "destroy", :id => "1"}
    end
  end
end
