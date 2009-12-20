class CreateTeststepResults < ActiveRecord::Migration
  def self.up
    create_table :teststep_results do |t|
      t.references :teststep
      t.boolean :result

      t.timestamps
    end
  end

  def self.down
    drop_table :teststep_results
  end
end
