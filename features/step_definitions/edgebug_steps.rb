Given /^I am on the (\w+) (\w+) page/ do |verb, noun|
	visit "/#{noun.pluralize}/#{verb}"
end

Given /^I am on the (\w+) page/ do |page|
  visit "/#{page}"
end
