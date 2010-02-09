class CreateTestsuites < ActiveRecord::Migration
  def self.up
    create_table :testsuites do |t|
      t.string :build

      t.timestamps
    end
  end

  def self.down
    drop_table :testsuites
  end
end
