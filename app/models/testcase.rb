class Testcase < ActiveRecord::Base
  has_many :teststeps
  has_many :testcase_results
  has_and_belongs_to_many :tags

  accepts_nested_attributes_for :teststeps, :allow_destroy => true

  def status
    testcase_result = TestcaseResult.first(select: "result", conditions: { testcase_id: self.id }, order: "created_at DESC")

    result = testcase_result && testcase_result.result
    { true => "success", false => "failure", nil => "pending" }[result]
  end

  def last_executed_time
    testcase_results = self.testcase_results

    if testcase_results.length == 0
      return "never"
    else
      testcase_results.last.created_at.to_s(:short)
    end
  end

  def tags=(value)
    tag_models = value.split(',').map(&:strip).map do |name|
      Tag.find(:first, :conditions => ["name='#{name}'"]) || Tag.create(:name => name)
    end
    tags << tag_models
  end

  def self.search(query)
    order = 'created_at desc'
    unless query.to_s.strip.empty?
      keywords = query.split.map { |k| "%#{k}%" }
      find(:all, :conditions => [(['title like ?']*keywords.length).join(" and "), keywords].flatten, :order => order)
    else
      find(:all, :order => order)
    end
  end
end
