class CreateSteps < ActiveRecord::Migration
  def self.up
    create_table :teststeps do |t|
      t.text :description
      t.references :testcase

      t.timestamps
    end
  end

  def self.down
    drop_table :teststeps
  end
end
