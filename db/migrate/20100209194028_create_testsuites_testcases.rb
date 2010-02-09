class CreateTestsuitesTestcases < ActiveRecord::Migration
  def self.up
    create_table :testsuites_testcases, :id => false do |t|
      t.references :testsuite
      t.references :testcase

      t.timestamps
    end
  end

  def self.down
    drop_table :testsuites_testcases
  end
end
