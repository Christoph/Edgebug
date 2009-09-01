Given /^I am on the (\w+) (\w+) page/ do |verb, noun|
	visit "/#{noun.pluralize}/#{verb}"
end
