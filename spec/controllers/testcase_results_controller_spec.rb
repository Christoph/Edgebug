require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TestcaseResultsController do

  before(:each) do
    @testcase_result = Factory(:testcase_result)
  end

  describe "responding to GET index" do

    it "should expose all testcase_results as @testcase_results" do
      get :index
      assigns[:testcase_results].should == [@testcase_result]
    end

    describe "with mime type of xml" do
  
      it "should render all testcase_results as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        TestcaseResult.should_receive(:find).with(:all).and_return(testcase_results = mock("Array of TestcaseResults"))
        testcase_results.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested testcase_result as @testcase_result" do
      get :show, :id => @testcase_result.id
      assigns[:testcase_result].should == @testcase_result
    end
    
    describe "with mime type of xml" do

      it "should render the requested testcase_result as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        TestcaseResult.should_receive(:find).with("37").and_return(@testcase_result)
        @testcase_result.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new testcase_result as @testcase_result" do
      testcase_result = Factory.build(:testcase_result)
      TestcaseResult.should_receive(:new).and_return(testcase_result)
      get :new
      assigns[:testcase_result].should equal(testcase_result)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested testcase_result as @testcase_result" do
      get :edit, :id => @testcase_result.id
      assigns[:testcase_result].should == @testcase_result
    end

  end

  describe "responding to POST create" do

    before(:each) do
      @new_testcase_result = Factory.build(:testcase_result)
    end

    describe "with valid params" do

      it "should expose a newly created testcase_result as @testcase_result" do
        TestcaseResult.should_receive(:new).with({'these' => 'params'}).and_return(@new_testcase_result)
        post :create, :testcase_result => {:these => 'params'}
        assigns(:testcase_result).should equal(@new_testcase_result)
      end

      it "should redirect to the created testcase_result" do
        TestcaseResult.stub!(:new).and_return(@new_testcase_result)
        post :create, :testcase_result => {}
        response.should redirect_to(testcase_result_url(@new_testcase_result))
      end
      
    end
    
    describe "with invalid params" do

      before(:each) do
        @new_testcase_result.stub!(:save => false)
      end

      it "should expose a newly created but unsaved testcase_result as @testcase_result" do
        TestcaseResult.stub!(:new).with({'these' => 'params'}).and_return(@new_testcase_result)
        post :create, :testcase_result => {:these => 'params'}
        assigns(:testcase_result).should equal(@new_testcase_result)
      end

      it "should re-render the 'new' template" do
        TestcaseResult.stub!(:new).and_return(@new_testcase_result)
        post :create, :testcase_result => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT update" do

    before(:each) do
      TestcaseResult.should_receive(:find).with(@testcase_result.id.to_s).and_return(@testcase_result)
    end

    it "should update the requested testcase_result" do
      @testcase_result.should_receive(:update_attributes).with({'these' => 'params'})
      put :update, :id => @testcase_result.id, :testcase_result => {:these => 'params'}
    end

    describe "with valid params" do

      before(:each) do
        @testcase_result.stub!(:update_attributes => true)
      end

      it "should expose the requested testcase_result as @testcase_result" do
        put :update, :id => @testcase_result.id
        assigns(:testcase_result).should equal(@testcase_result)
      end

      it "should redirect to the testcase_result" do
        put :update, :id => @testcase_result.id
        response.should redirect_to(testcase_result_url(@testcase_result))
      end

    end
    
    describe "with invalid params" do

      before(:each) do
        @testcase_result.stub!(:update_attributes => false)
      end

      it "should expose the testcase_result as @testcase_result" do
        put :update, :id => @testcase_result.id
        assigns(:testcase_result).should equal(@testcase_result)
      end

      it "should re-render the 'edit' template" do
        put :update, :id => @testcase_result.id
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested testcase_result" do
      TestcaseResult.should_receive(:find).with(@testcase_result.id.to_s).and_return(@testcase_result)
      @testcase_result.should_receive(:destroy)
      delete :destroy, :id => @testcase_result.id
    end
  
    it "should redirect to the testcase_results list" do
      delete :destroy, :id => @testcase_result.id
      response.should redirect_to(testcase_results_url)
    end

  end

end
