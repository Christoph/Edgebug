class TestcasesController < ApplicationController
  before_filter :find_testcase, :only => [ :show, :edit, :update, :destroy ]

  add_breadcrumb "home", "/"
  add_breadcrumb "Testcases", "/testcases"


  # GET /testcases
  # GET /testcases.xml
  def index
    
    @testcases = Testcase.search(params[:s])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testcases }
    end
  end

  # GET /testcases/1
  # GET /testcases/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @testcase }
    end
  end

  # GET /testcases/new
  # GET /testcases/new.xml
  def new
    @testcase = Testcase.new
    @testcase.teststeps.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @testcase }
    end
  end

  # GET /testcases/1/edit
  def edit
  end

  # POST /testcases
  # POST /testcases.xml
  def create
    @testcase = Testcase.new(params[:testcase])

    respond_to do |format|
      if @testcase.save
        flash[:notice] = 'Testcase was successfully created.'
        format.html { redirect_to(testcases_url) }
        format.xml  { render :xml => "testcases", :status => :created, :location => @testcase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @testcase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /testcases/1
  # PUT /testcases/1.xml
  def update
    respond_to do |format|
      if @testcase.update_attributes(params[:testcase])
        flash[:notice] = 'Testcase was successfully updated.'
        format.html { redirect_to(@testcase) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @testcase.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /testcases/1
  # DELETE /testcases/1.xml
  def destroy
    @testcase.destroy

    respond_to do |format|
      format.html { redirect_to(testcases_url) }
      format.xml  { head :ok }
    end
  end

  private

  def find_testcase
    @testcase = Testcase.find(params[:id])
    raise ArgumentError, 'Invalid testcase id provided' unless @testcase
  end
end
