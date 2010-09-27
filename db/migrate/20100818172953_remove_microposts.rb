class RemoveMicroposts < ActiveRecord::Migration
  def self.up
    drop_table :microposts
  end

  def self.down
    create_table :microposts do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :microposts, :user_id
  end
end
