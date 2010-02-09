require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TestsuitesController do

  before(:each) do
    @testsuite = Factory(:testsuite)
  end

  describe "responding to GET index" do

    it "should expose all testsuites as @testsuites" do
      get :index
      assigns[:testsuites].should == [@testsuite]
    end

    describe "with mime type of xml" do
  
      it "should render all testsuites as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Testsuite.should_receive(:find).with(:all).and_return(testsuites = mock("Array of Testsuites"))
        testsuites.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested testsuite as @testsuite" do
      get :show, :id => @testsuite.id
      assigns[:testsuite].should == @testsuite
    end
    
    describe "with mime type of xml" do

      it "should render the requested testsuite as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Testsuite.should_receive(:find).with("37").and_return(@testsuite)
        @testsuite.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new testsuite as @testsuite" do
      testsuite = Factory.build(:testsuite)
      Testsuite.should_receive(:new).and_return(testsuite)
      get :new
      assigns[:testsuite].should equal(testsuite)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested testsuite as @testsuite" do
      get :edit, :id => @testsuite.id
      assigns[:testsuite].should == @testsuite
    end

  end

  describe "responding to POST create" do

    before(:each) do
      @new_testsuite = Factory.build(:testsuite)
    end

    describe "with valid params" do

      it "should expose a newly created testsuite as @testsuite" do
        Testsuite.should_receive(:new).with({'these' => 'params'}).and_return(@new_testsuite)
        post :create, :testsuite => {:these => 'params'}
        assigns(:testsuite).should equal(@new_testsuite)
      end

      it "should redirect to the created testsuite" do
        Testsuite.stub!(:new).and_return(@new_testsuite)
        post :create, :testsuite => {}
        response.should redirect_to(testsuite_url(@new_testsuite))
      end
      
    end
    
    describe "with invalid params" do

      before(:each) do
        @new_testsuite.stub!(:save => false)
      end

      it "should expose a newly created but unsaved testsuite as @testsuite" do
        Testsuite.stub!(:new).with({'these' => 'params'}).and_return(@new_testsuite)
        post :create, :testsuite => {:these => 'params'}
        assigns(:testsuite).should equal(@new_testsuite)
      end

      it "should re-render the 'new' template" do
        Testsuite.stub!(:new).and_return(@new_testsuite)
        post :create, :testsuite => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT update" do

    before(:each) do
      Testsuite.should_receive(:find).with(@testsuite.id.to_s).and_return(@testsuite)
    end

    it "should update the requested testsuite" do
      @testsuite.should_receive(:update_attributes).with({'these' => 'params'})
      put :update, :id => @testsuite.id, :testsuite => {:these => 'params'}
    end

    describe "with valid params" do

      before(:each) do
        @testsuite.stub!(:update_attributes => true)
      end

      it "should expose the requested testsuite as @testsuite" do
        put :update, :id => @testsuite.id
        assigns(:testsuite).should equal(@testsuite)
      end

      it "should redirect to the testsuite" do
        put :update, :id => @testsuite.id
        response.should redirect_to(testsuite_url(@testsuite))
      end

    end
    
    describe "with invalid params" do

      before(:each) do
        @testsuite.stub!(:update_attributes => false)
      end

      it "should expose the testsuite as @testsuite" do
        put :update, :id => @testsuite.id
        assigns(:testsuite).should equal(@testsuite)
      end

      it "should re-render the 'edit' template" do
        put :update, :id => @testsuite.id
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested testsuite" do
      Testsuite.should_receive(:find).with(@testsuite.id.to_s).and_return(@testsuite)
      @testsuite.should_receive(:destroy)
      delete :destroy, :id => @testsuite.id
    end
  
    it "should redirect to the testsuites list" do
      delete :destroy, :id => @testsuite.id
      response.should redirect_to(testsuites_url)
    end

  end

end
