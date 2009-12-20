require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/teststep_results/edit.html.haml" do
  include TeststepResultsHelper
  
  before(:each) do
    assigns[:teststep_result] = @teststep_result = Factory(:teststep_result)
  end

  it "should render edit form" do
    render "/teststep_results/edit.html.haml"
    
    response.should have_tag("form[action=#{teststep_result_path(@teststep_result)}][method=post]") do
      with_tag('input#teststep_result_teststep[name=?]', "teststep_result[teststep]")
      with_tag('input#teststep_result_result[name=?]', "teststep_result[result]")
    end
  end
end


