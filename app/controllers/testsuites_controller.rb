class TestsuitesController < ApplicationController
  before_filter :find_testsuite, :only => [ :show, :edit, :update, :destroy ]

  # GET /testsuites
  # GET /testsuites.xml
  def index
    @testsuites = Testsuite.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testsuites }
    end
  end

  # GET /testsuites/1
  # GET /testsuites/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @testsuite }
    end
  end

  # GET /testsuites/new
  # GET /testsuites/new.xml
  def new
    @testsuite = Testsuite.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @testsuite }
    end
  end

  # GET /testsuites/1/edit
  def edit
  end

  # POST /testsuites
  # POST /testsuites.xml
  def create
    @testsuite = Testsuite.new(params[:testsuite])

    respond_to do |format|
      if @testsuite.save
        flash[:notice] = 'Testsuite was successfully created.'
        format.html { redirect_to(@testsuite) }
        format.xml  { render :xml => @testsuite, :status => :created, :location => @testsuite }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @testsuite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /testsuites/1
  # PUT /testsuites/1.xml
  def update
    respond_to do |format|
      if @testsuite.update_attributes(params[:testsuite])
        flash[:notice] = 'Testsuite was successfully updated.'
        format.html { redirect_to(@testsuite) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @testsuite.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /testsuites/1
  # DELETE /testsuites/1.xml
  def destroy
    @testsuite.destroy

    respond_to do |format|
      format.html { redirect_to(testsuites_url) }
      format.xml  { head :ok }
    end
  end

  def add_testcases
    testsuite_id = params[:testsuite][:id]
    testsuite = Testsuite.find(testsuite_id)
    cases = []
    params[:testcase_id].each do |c|
      cases << Testcase.find(c)
    end
    testsuite.testcases << cases

    # redirect to suite/id
    respond_to do |format|
      format.html { redirect_to(testsuites_url) }
    end
  end

  private

  def find_testsuite
    @testsuite = Testsuite.find(params[:id])
    raise ArgumentError, 'Invalid testsuite id provided' unless @testsuite
  end
end
