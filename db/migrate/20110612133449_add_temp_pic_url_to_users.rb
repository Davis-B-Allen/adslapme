class AddTempPicUrlToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :temp_pic_url, :string
  end

  def self.down
    remove_column :users, :temp_pic_url
  end
end
