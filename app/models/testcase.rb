class Testcase < ActiveRecord::Base
  has_many :teststeps

  def status
    stati = ["success", "failure", "pending"]
    stati[rand 3]
  end

  def step_attributes=(step_attributes)
    step_attributes.each do |attributes|
      teststeps.build(attributes)
    end
  end
end
