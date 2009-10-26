class Testcase < ActiveRecord::Base
  has_many :steps

  def status
    stati = ["success", "failure", "pending"]
    stati[rand 3]
  end

  def step_attributes=(step_attributes)
    step_attributes.each do |attributes|
      steps.build(attributes)
    end
  end
end
