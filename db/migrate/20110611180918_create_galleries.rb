class CreateGalleries < ActiveRecord::Migration
  def self.up
    create_table :galleries do |t|
      t.string :name
      t.string :url
      t.integer :width
      t.integer :height

      t.timestamps
    end
  end

  def self.down
    drop_table :galleries
  end
end
