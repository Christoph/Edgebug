class Testcase < ActiveRecord::Base
  has_many :teststeps
  accepts_nested_attributes_for :teststeps, :allow_destroy => true

  def status
    testcase_result = TestcaseResult.first(select: "result", conditions: { testcase_id: self.id }, order: "created_at DESC")
 
    result = testcase_result && testcase_result.result
    { true => "success", false => "failure", nil => "pending" }[result]
  end
end
