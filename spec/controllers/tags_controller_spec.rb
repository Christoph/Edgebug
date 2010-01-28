require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TagsController do

  before(:each) do
    @tag = Factory(:tag)
  end

  describe "responding to GET index" do

    it "should expose all tags as @tags" do
      get :index
      assigns[:tags].should == [@tag]
    end

    describe "with mime type of xml" do
  
      it "should render all tags as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Tag.should_receive(:find).with(:all).and_return(tags = mock("Array of Tags"))
        tags.should_receive(:to_xml).and_return("generated XML")
        get :index
        response.body.should == "generated XML"
      end
    
    end

  end

  describe "responding to GET show" do

    it "should expose the requested tag as @tag" do
      get :show, :id => @tag.id
      assigns[:tag].should == @tag
    end
    
    describe "with mime type of xml" do

      it "should render the requested tag as xml" do
        request.env["HTTP_ACCEPT"] = "application/xml"
        Tag.should_receive(:find).with("37").and_return(@tag)
        @tag.should_receive(:to_xml).and_return("generated XML")
        get :show, :id => "37"
        response.body.should == "generated XML"
      end

    end
    
  end

  describe "responding to GET new" do
  
    it "should expose a new tag as @tag" do
      tag = Factory.build(:tag)
      Tag.should_receive(:new).and_return(tag)
      get :new
      assigns[:tag].should equal(tag)
    end

  end

  describe "responding to GET edit" do
  
    it "should expose the requested tag as @tag" do
      get :edit, :id => @tag.id
      assigns[:tag].should == @tag
    end

  end

  describe "responding to POST create" do

    before(:each) do
      @new_tag = Factory.build(:tag)
    end

    describe "with valid params" do

      it "should expose a newly created tag as @tag" do
        Tag.should_receive(:new).with({'these' => 'params'}).and_return(@new_tag)
        post :create, :tag => {:these => 'params'}
        assigns(:tag).should equal(@new_tag)
      end

      it "should redirect to the created tag" do
        Tag.stub!(:new).and_return(@new_tag)
        post :create, :tag => {}
        response.should redirect_to(tag_url(@new_tag))
      end
      
    end
    
    describe "with invalid params" do

      before(:each) do
        @new_tag.stub!(:save => false)
      end

      it "should expose a newly created but unsaved tag as @tag" do
        Tag.stub!(:new).with({'these' => 'params'}).and_return(@new_tag)
        post :create, :tag => {:these => 'params'}
        assigns(:tag).should equal(@new_tag)
      end

      it "should re-render the 'new' template" do
        Tag.stub!(:new).and_return(@new_tag)
        post :create, :tag => {}
        response.should render_template('new')
      end
      
    end
    
  end

  describe "responding to PUT update" do

    before(:each) do
      Tag.should_receive(:find).with(@tag.id.to_s).and_return(@tag)
    end

    it "should update the requested tag" do
      @tag.should_receive(:update_attributes).with({'these' => 'params'})
      put :update, :id => @tag.id, :tag => {:these => 'params'}
    end

    describe "with valid params" do

      before(:each) do
        @tag.stub!(:update_attributes => true)
      end

      it "should expose the requested tag as @tag" do
        put :update, :id => @tag.id
        assigns(:tag).should equal(@tag)
      end

      it "should redirect to the tag" do
        put :update, :id => @tag.id
        response.should redirect_to(tag_url(@tag))
      end

    end
    
    describe "with invalid params" do

      before(:each) do
        @tag.stub!(:update_attributes => false)
      end

      it "should expose the tag as @tag" do
        put :update, :id => @tag.id
        assigns(:tag).should equal(@tag)
      end

      it "should re-render the 'edit' template" do
        put :update, :id => @tag.id
        response.should render_template('edit')
      end

    end

  end

  describe "responding to DELETE destroy" do

    it "should destroy the requested tag" do
      Tag.should_receive(:find).with(@tag.id.to_s).and_return(@tag)
      @tag.should_receive(:destroy)
      delete :destroy, :id => @tag.id
    end
  
    it "should redirect to the tags list" do
      delete :destroy, :id => @tag.id
      response.should redirect_to(tags_url)
    end

  end

end
