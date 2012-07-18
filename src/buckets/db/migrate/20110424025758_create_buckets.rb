class CreateBuckets < ActiveRecord::Migration
  def self.up
    create_table :buckets do |t|
      t.string :code
      t.string :description
    end
    add_index :buckets, [:code], :unique => true
  end

  def self.down
    drop_table :buckets
  end
end
