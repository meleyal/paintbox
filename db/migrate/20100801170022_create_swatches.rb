class CreateSwatches < ActiveRecord::Migration
  def self.up
    create_table :swatches do |t|
      t.references :user
      t.references :color
      t.integer :position
      t.timestamps
    end
  end

  def self.down
    drop_table :swatches
  end
end
