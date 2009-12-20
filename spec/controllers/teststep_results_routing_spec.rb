require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TeststepResultsController do
  describe "route generation" do
    it "should map #index" do
      route_for(:controller => "teststep_results", :action => "index").should == "/teststep_results"
    end
  
    it "should map #new" do
      route_for(:controller => "teststep_results", :action => "new").should == "/teststep_results/new"
    end
  
    it "should map #show" do
      route_for(:controller => "teststep_results", :action => "show", :id => '1').should == "/teststep_results/1"
    end
  
    it "should map #edit" do
      route_for(:controller => "teststep_results", :action => "edit", :id => '1').should == "/teststep_results/1/edit"
    end
  
    it "should map #update" do
      route_for(:controller => "teststep_results", :action => "update", :id => '1').should == { :path => "/teststep_results/1", :method => :put }
    end
  
    it "should map #destroy" do
      route_for(:controller => "teststep_results", :action => "destroy", :id => '1').should == { :path => "/teststep_results/1", :method => :delete }
    end
  end

  describe "route recognition" do
    it "should generate params for #index" do
      params_from(:get, "/teststep_results").should == {:controller => "teststep_results", :action => "index"}
    end
  
    it "should generate params for #new" do
      params_from(:get, "/teststep_results/new").should == {:controller => "teststep_results", :action => "new"}
    end
  
    it "should generate params for #create" do
      params_from(:post, "/teststep_results").should == {:controller => "teststep_results", :action => "create"}
    end
  
    it "should generate params for #show" do
      params_from(:get, "/teststep_results/1").should == {:controller => "teststep_results", :action => "show", :id => "1"}
    end
  
    it "should generate params for #edit" do
      params_from(:get, "/teststep_results/1/edit").should == {:controller => "teststep_results", :action => "edit", :id => "1"}
    end
  
    it "should generate params for #update" do
      params_from(:put, "/teststep_results/1").should == {:controller => "teststep_results", :action => "update", :id => "1"}
    end
  
    it "should generate params for #destroy" do
      params_from(:delete, "/teststep_results/1").should == {:controller => "teststep_results", :action => "destroy", :id => "1"}
    end
  end
end
