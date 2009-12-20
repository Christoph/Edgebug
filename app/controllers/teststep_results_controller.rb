class TeststepResultsController < ApplicationController
  before_filter :find_teststep_result, :only => [ :show, :edit, :update, :destroy ]

  # GET /teststep_results
  # GET /teststep_results.xml
  def index
    @teststep_results = TeststepResult.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @teststep_results }
    end
  end

  # GET /teststep_results/1
  # GET /teststep_results/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @teststep_result }
    end
  end

  # GET /teststep_results/new
  # GET /teststep_results/new.xml
  def new
    @teststep_result = TeststepResult.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @teststep_result }
    end
  end

  # GET /teststep_results/1/edit
  def edit
  end

  # POST /teststep_results
  # POST /teststep_results.xml
  def create
    @teststep_result = TeststepResult.new(params[:teststep_result])

    respond_to do |format|
      if @teststep_result.save
        flash[:notice] = 'TeststepResult was successfully created.'
        format.html { redirect_to(@teststep_result) }
        format.xml  { render :xml => @teststep_result, :status => :created, :location => @teststep_result }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @teststep_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /teststep_results/1
  # PUT /teststep_results/1.xml
  def update
    respond_to do |format|
      if @teststep_result.update_attributes(params[:teststep_result])
        flash[:notice] = 'TeststepResult was successfully updated.'
        format.html { redirect_to(@teststep_result) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @teststep_result.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /teststep_results/1
  # DELETE /teststep_results/1.xml
  def destroy
    @teststep_result.destroy

    respond_to do |format|
      format.html { redirect_to(teststep_results_url) }
      format.xml  { head :ok }
    end
  end

  private

  def find_teststep_result
    @teststep_result = TeststepResult.find(params[:id])
    raise ArgumentError, 'Invalid teststep_result id provided' unless @teststep_result
  end
end
