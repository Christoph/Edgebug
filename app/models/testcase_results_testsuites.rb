class TestcaseResultsTestsuites < ActiveRecord::Base
  belongs_to :testcase_result
  belongs_to :testsuite
end
