class TestcaseResult < ActiveRecord::Base
  has_many :teststep_results
  belongs_to :testcase

  def teststep_result_attributes=(step_result_attributes)
    step_result_attributes.each do |attributes|
      teststep_results.build(attributes)
    end

    self.result = teststep_results.inject(true) do |visitor, step_result|
      visitor && (step_result.result == nil ? false : step_result.result)
    end
  end
end
