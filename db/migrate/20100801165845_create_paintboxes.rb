class CreatePaintboxes < ActiveRecord::Migration
  def self.up
    create_table :paintboxes do |t|
      t.references :user
      t.timestamps
    end
  end

  def self.down
    drop_table :paintboxes
  end
end
