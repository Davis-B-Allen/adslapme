class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :uid
      t.string :first_name
      t.string :last_name
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
