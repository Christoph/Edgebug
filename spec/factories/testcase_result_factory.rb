Factory.define :testcase_result do |testcase_result|
  testcase_result.testcase Factory(:testcase) 
  testcase_result.result false
  #testcase_result.teststep_results = 2.times {Factory(:teststep_result)}
end
