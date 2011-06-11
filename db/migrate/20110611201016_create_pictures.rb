class CreatePictures < ActiveRecord::Migration
  def self.up
    create_table :pictures do |t|
      t.integer :uid
      t.string :thumb_url
      t.string :source_url
      t.string :album_id

      t.timestamps
    end
  end

  def self.down
    drop_table :pictures
  end
end
