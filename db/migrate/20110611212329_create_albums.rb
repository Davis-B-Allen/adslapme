class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.integer :uid
      t.integer :user_id
      t.integer :cover_photo_id

      t.timestamps
    end
  end

  def self.down
    drop_table :albums
  end
end
