class Testsuite < ActiveRecord::Base
  has_and_belongs_to_many :testcases
end
