class RemovePaintboxes < ActiveRecord::Migration
  def self.up
    drop_table :paintboxes
  end

  def self.down
    create_table :paintboxes do |t|
      t.references :user
      t.timestamps
    end
  end
end
