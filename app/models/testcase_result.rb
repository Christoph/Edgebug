class TestcaseResult < ActiveRecord::Base
  has_many :teststep_results
  belongs_to :testcase

  def teststep_result_attributes=(step_result_attributes)
    step_result_attributes.each do |attributes|
      teststep_results.build(attributes)
    end

    ##result = teststep_results.reduce {|sum, step_result| sum &&= step_result }
    @result = true
    result = false
    save
  end
end
