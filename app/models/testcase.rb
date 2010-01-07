class Testcase < ActiveRecord::Base
  has_many :teststeps

  named_scope :status 
  def status
    testcase_result = TestcaseResult.first(select: "result", conditions: { testcase_id: self.id }, order: "created_at DESC")
 
    result = testcase_result && testcase_result.result
    { true => "success", false => "failure", nil => "pending" }[result]
  end

  def step_attributes=(step_attributes)
    step_attributes.each do |attributes|
      teststeps.build(attributes)
    end
  end
end
