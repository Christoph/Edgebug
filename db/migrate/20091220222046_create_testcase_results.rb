class CreateTestcaseResults < ActiveRecord::Migration
  def self.up
    create_table :testcase_results do |t|
      t.references :testcase
      t.references :testsuite
      t.boolean :result

      t.timestamps
    end
  end

  def self.down
    drop_table :testcase_results
  end
end
