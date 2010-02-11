# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

if RAILS_ENV != "production" then
  tags = []
  12.times { tags << Tag.create(:name => Faker::Lorem.words(1)[0]) }

  10.times do
    testcase = Testcase.create(:title => Faker::Lorem.words(rand(7) + 1).join(' ').capitalize)
    rand(6).times do
      testcase.tags << tags[rand(12)]
    end
    rand(8).times do
      Teststep.create(:description => Faker::Lorem.paragraph, :testcase => testcase)
    end
  end
  
  s = Testsuite.create
  s.build = "ASDF"
  
  s.testcases << Testcase.find(1)
  s.testcases << Testcase.find(2)
end
