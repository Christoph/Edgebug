Factory.define :teststep_result do |teststep_result|
  teststep_result.teststep Factory(:teststep)
  teststep_result.result false
end
