class CreateTestcasesTestsuites < ActiveRecord::Migration
  def self.up
    create_table :testcases_testsuites, :id => false do |t|
      t.references :testsuite
      t.references :testcase

      t.timestamps
    end
  end

  def self.down
    drop_table :testcases_testsuites
  end
end
