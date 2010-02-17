class CreateTestcaseResultsTestsuites < ActiveRecord::Migration
  def self.up
    create_table :testcase_results_testsuites do |t|
      t.references :testcase_result
      t.references :testsuite

      t.timestamps
    end
  end

  def self.down
    drop_table :testcase_results_testsuites
  end
end
