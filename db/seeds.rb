# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

if RAILS_ENV == "production" then
  return
end

10.times do
  Testcase.create(:title => Faker::Lorem.words(rand(7)+1).join(' ').capitalize)
end
