Given /^I am on the (\w+) (\w+) page/ do |verb, noun|
	visit "/#{noun.pluralize}/#{verb}"
end

Given /^I am on the (\w+) page/ do |page|
  visit "/#{page}"
end

Given /^I have a testcase "([^\"]*)" with the steps "([^\"]*)" and "([^\"]*)"$/ do |testcase_name, step1_name, step2_name|
  raise testcase_name
  testcase = Testcase.create(:title => testcase_name)
  testcase.steps << Step.create(:description => step1_name)
  testcase.steps << Step.create(:description => step2_name)
end
