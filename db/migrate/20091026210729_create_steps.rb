class CreateSteps < ActiveRecord::Migration
  def self.up
    create_table :steps do |t|
      t.text :description
      t.reference :testcase

      t.timestamps
    end
  end

  def self.down
    drop_table :steps
  end
end
