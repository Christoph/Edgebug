class TestcaseResult < ActiveRecord::Base
  has_many :teststep_results
  belongs_to :testcase
  accepts_nested_attributes_for :teststep_results, :allow_destroy => true

  before_save :update_result

  def update_result
    self.result = teststep_results.inject(true) do |visitor, step_result|
      visitor && (step_result.result == nil ? false : step_result.result)
    end

    return true #continue saving
  end
end
