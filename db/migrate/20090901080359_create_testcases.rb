class CreateTestcases < ActiveRecord::Migration
  def self.up
    create_table :testcases do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :testcases
  end
end
