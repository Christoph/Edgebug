class Testcase < ActiveRecord::Base
  def status
    stati = ["success", "failure", "pending"]
    stati[rand 3]
  end
end
