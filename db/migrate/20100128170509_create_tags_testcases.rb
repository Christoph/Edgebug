class CreateTagsTestcases < ActiveRecord::Migration
  def self.up
    create_table :tags_testcases, :id => false do |t|
      t.references :testcase
      t.references :tag

      t.timestamps
    end
  end

  def self.down
    drop_table :tags_testcases
  end
end
