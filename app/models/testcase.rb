class Testcase < ActiveRecord::Base
  has_many :teststeps
  accepts_nested_attributes_for :teststeps, :allow_destroy => true

  def status
    testcase_result = TestcaseResult.first(select: "result", conditions: { testcase_id: self.id }, order: "created_at DESC")
 
    result = testcase_result && testcase_result.result
    { true => "success", false => "failure", nil => "pending" }[result]
  end

  def self.search(query)
    unless query.to_s.strip.empty?
      find(:all, :conditions => ['title like ?', "%#{query}%"], :order => 'created_at desc')
    else
      find(:all, :order => 'created_at desc')
    end
  end
end
