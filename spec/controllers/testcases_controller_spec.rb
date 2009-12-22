require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TestcasesController do

  before(:each) do
    @testcase = Factory(:testcase)
  end

  describe "responding to GET index" do

    it "should expose all testcases as @testcases" do
      Testcase.should_receive(:find).with(:all).and_return([@testcase])
      get :index
      assigns[:testcases].should == [@testcase]
    end

    describe "with mime type of xml" do
  
      it "should render all testcases as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Testcase.should_receive(:find).with(:all).and_return(testcases = mock("Array of Testcases"))
        testcases.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested testcase as @testcase" do
      get :show, :id => @testcase.id
      assigns[:testcase].should == @testcase
    end
    
    describe "with mime type of xml" do

      it "should render the requested testcase as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Testcase.should_receive(:find).with("37").and_return(@testcase)
        @testcase.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new testcase as @testcase" do
      testcase = Factory.build(:testcase)
      Testcase.should_receive(:new).and_return(testcase)
      get :new
      assigns[:testcase].should equal(testcase)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested testcase as @testcase" do
      get :edit, :id => @testcase.id
      assigns[:testcase].should == @testcase
    end

  end

  describe "responding to POST create" do

    before(:each) do
      @new_testcase = Factory.build(:testcase)
    end

    describe "with valid params" do

      it "should expose a newly created testcase as @testcase" do
        Testcase.should_receive(:new).with({'these' => 'params'}).and_return(@new_testcase)
        post :create, :testcase => {:these => 'params'}
        assigns(:testcase).should equal(@new_testcase)
      end

      it "should redirect to the created testcase" do
        Testcase.stub!(:new).and_return(@new_testcase)
        post :create, :testcase => {}
        response.should redirect_to(testcases_url)
      end
      
    end
    
    describe "with invalid params" do

      before(:each) do
        @new_testcase.stub!(:save => false)
      end

      it "should expose a newly created but unsaved testcase as @testcase" do
        Testcase.stub!(:new).with({'these' => 'params'}).and_return(@new_testcase)
        post :create, :testcase => {:these => 'params'}
        assigns(:testcase).should equal(@new_testcase)
      end

      it "should re-render the 'new' template" do
        Testcase.stub!(:new).and_return(@new_testcase)
        post :create, :testcase => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT update" do

    before(:each) do
      Testcase.should_receive(:find).with(@testcase.id.to_s).and_return(@testcase)
    end

    it "should update the requested testcase" do
      @testcase.should_receive(:update_attributes).with({'these' => 'params'})
      put :update, :id => @testcase.id, :testcase => {:these => 'params'}
    end

    describe "with valid params" do

      before(:each) do
        @testcase.stub!(:update_attributes => true)
      end

      it "should expose the requested testcase as @testcase" do
        put :update, :id => @testcase.id
        assigns(:testcase).should equal(@testcase)
      end

      it "should redirect to the testcase" do
        put :update, :id => @testcase.id
        response.should redirect_to(testcase_url(@testcase))
      end

    end
    
    describe "with invalid params" do

      before(:each) do
        @testcase.stub!(:update_attributes => false)
      end

      it "should expose the testcase as @testcase" do
        put :update, :id => @testcase.id
        assigns(:testcase).should equal(@testcase)
      end

      it "should re-render the 'edit' template" do
        put :update, :id => @testcase.id
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested testcase" do
      Testcase.should_receive(:find).with(@testcase.id.to_s).and_return(@testcase)
      @testcase.should_receive(:destroy)
      delete :destroy, :id => @testcase.id
    end
  
    it "should redirect to the testcases list" do
      delete :destroy, :id => @testcase.id
      response.should redirect_to(testcases_url)
    end

  end

end
