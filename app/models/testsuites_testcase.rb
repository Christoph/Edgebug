class TestcasesTestsuites < ActiveRecord::Base
  belongs_to :testcase
  belongs_to :testsuite
end
