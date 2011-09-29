class AddConfirmedToUsersFriends < ActiveRecord::Migration
  def self.up
    add_column :users_friends, :confirmed, :boolean
  end

  def self.down
    remove_column :users_friends, :confirmed
  end
end
