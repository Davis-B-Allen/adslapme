class AddFeatherLinkToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :feather_link, :string
  end

  def self.down
    remove_column :users, :feather_link
  end
end
