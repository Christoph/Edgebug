require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TeststepResultsController do

  before(:each) do
    @teststep_result = Factory(:teststep_result)
  end

  describe "responding to GET index" do

    it "should expose all teststep_results as @teststep_results" do
      get :index
      assigns[:teststep_results].should == [@teststep_result]
    end

    describe "with mime type of xml" do
  
      it "should render all teststep_results as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        TeststepResult.should_receive(:find).with(:all).and_return(teststep_results = mock("Array of TeststepResults"))
        teststep_results.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested teststep_result as @teststep_result" do
      get :show, :id => @teststep_result.id
      assigns[:teststep_result].should == @teststep_result
    end
    
    describe "with mime type of xml" do

      it "should render the requested teststep_result as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        TeststepResult.should_receive(:find).with("37").and_return(@teststep_result)
        @teststep_result.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new teststep_result as @teststep_result" do
      teststep_result = Factory.build(:teststep_result)
      TeststepResult.should_receive(:new).and_return(teststep_result)
      get :new
      assigns[:teststep_result].should equal(teststep_result)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested teststep_result as @teststep_result" do
      get :edit, :id => @teststep_result.id
      assigns[:teststep_result].should == @teststep_result
    end

  end

  describe "responding to POST create" do

    before(:each) do
      @new_teststep_result = Factory.build(:teststep_result)
    end

    describe "with valid params" do

      it "should expose a newly created teststep_result as @teststep_result" do
        TeststepResult.should_receive(:new).with({'these' => 'params'}).and_return(@new_teststep_result)
        post :create, :teststep_result => {:these => 'params'}
        assigns(:teststep_result).should equal(@new_teststep_result)
      end

      it "should redirect to the created teststep_result" do
        TeststepResult.stub!(:new).and_return(@new_teststep_result)
        post :create, :teststep_result => {}
        response.should redirect_to(teststep_result_url(@new_teststep_result))
      end
      
    end
    
    describe "with invalid params" do

      before(:each) do
        @new_teststep_result.stub!(:save => false)
      end

      it "should expose a newly created but unsaved teststep_result as @teststep_result" do
        TeststepResult.stub!(:new).with({'these' => 'params'}).and_return(@new_teststep_result)
        post :create, :teststep_result => {:these => 'params'}
        assigns(:teststep_result).should equal(@new_teststep_result)
      end

      it "should re-render the 'new' template" do
        TeststepResult.stub!(:new).and_return(@new_teststep_result)
        post :create, :teststep_result => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT update" do

    before(:each) do
      TeststepResult.should_receive(:find).with(@teststep_result.id.to_s).and_return(@teststep_result)
    end

    it "should update the requested teststep_result" do
      @teststep_result.should_receive(:update_attributes).with({'these' => 'params'})
      put :update, :id => @teststep_result.id, :teststep_result => {:these => 'params'}
    end

    describe "with valid params" do

      before(:each) do
        @teststep_result.stub!(:update_attributes => true)
      end

      it "should expose the requested teststep_result as @teststep_result" do
        put :update, :id => @teststep_result.id
        assigns(:teststep_result).should equal(@teststep_result)
      end

      it "should redirect to the teststep_result" do
        put :update, :id => @teststep_result.id
        response.should redirect_to(teststep_result_url(@teststep_result))
      end

    end
    
    describe "with invalid params" do

      before(:each) do
        @teststep_result.stub!(:update_attributes => false)
      end

      it "should expose the teststep_result as @teststep_result" do
        put :update, :id => @teststep_result.id
        assigns(:teststep_result).should equal(@teststep_result)
      end

      it "should re-render the 'edit' template" do
        put :update, :id => @teststep_result.id
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested teststep_result" do
      TeststepResult.should_receive(:find).with(@teststep_result.id.to_s).and_return(@teststep_result)
      @teststep_result.should_receive(:destroy)
      delete :destroy, :id => @teststep_result.id
    end
  
    it "should redirect to the teststep_results list" do
      delete :destroy, :id => @teststep_result.id
      response.should redirect_to(teststep_results_url)
    end

  end

end
