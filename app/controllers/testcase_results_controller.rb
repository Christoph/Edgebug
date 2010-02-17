class TestcaseResultsController < ApplicationController
  before_filter :find_testcase_result, :only => [ :show, :edit, :update, :destroy ]

  # GET /testcase_results
  # GET /testcase_results.xml
  def index
    @testcase_results = TestcaseResult.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @testcase_results }
    end
  end

  # GET /testcase_results/1
  # GET /testcase_results/1.xml
  def show
    respond_to do |format|
      format.html { redirect_to :controller => 'testcases', :action => 'index' }
      format.xml { render :xml => @testcase_result }
    end
  end

  # GET /testcase_results/new
  # GET /testcase_results/new.xml
  def new
    @testcase_result = TestcaseResult.new
    @testcase = Testcase.find(params[:testcase_id])
    @testcase_result.testcase = @testcase
    @testsuite = Testsuite.find(params[:testsuite_id])

    @testcase.teststeps.map {|x| @testcase_result.teststep_results.build(:teststep => x, :testcase_result => @testcase_result) }
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @testcase_result }
    end
  end

  # GET /testcase_results/1/edit
  def edit
  end

  # POST /testcase_results
  # POST /testcase_results.xml
  def create
    @testcase_result = TestcaseResult.new(params[:testcase_result])

    respond_to do |format|
      if @testcase_result.save
        flash[:notice] = 'TestcaseResult was successfully created.'
        format.html { redirect_to(Testsuite.find(params[:testsuite_id])) }
        format.xml  { render :xml => @testcase_result, :status => :created, :location => @testcase_result }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @testcase_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /testcase_results/1
  # PUT /testcase_results/1.xml
  def update
    respond_to do |format|
      if @testcase_result.update_attributes(params[:testcase_result])
        flash[:notice] = 'TestcaseResult was successfully updated.'
        format.html { redirect_to(@testcase_result) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @testcase_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /testcase_results/1
  # DELETE /testcase_results/1.xml
  def destroy
    @testcase_result.destroy

    respond_to do |format|
      format.html { redirect_to(testcase_results_url) }
      format.xml  { head :ok }
    end
  end

  private

  def find_testcase_result
    @testcase_result = TestcaseResult.find(params[:id])
    raise ArgumentError, 'Invalid testcase_result id provided' unless @testcase_result
  end
end
