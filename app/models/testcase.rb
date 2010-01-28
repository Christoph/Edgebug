class Testcase < ActiveRecord::Base
  has_many :teststeps
  has_and_belongs_to_many :tags
  accepts_nested_attributes_for :teststeps, :allow_destroy => true

  def status
    testcase_result = TestcaseResult.first(select: "result", conditions: { testcase_id: self.id }, order: "created_at DESC")
 
    result = testcase_result && testcase_result.result
    { true => "success", false => "failure", nil => "pending" }[result]
  end

  def tags=(value)
    tag_models = value.split(',').map(&:strip).map do |name|
      Tag.find(:first, :conditions => ["name='#{name}'"]) || Tag.create(:name => name)
    end
    tags << tag_models
  end
end
