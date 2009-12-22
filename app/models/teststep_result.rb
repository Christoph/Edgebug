class TeststepResult < ActiveRecord::Base
  belongs_to :teststep
  belongs_to :testcase_result
end
