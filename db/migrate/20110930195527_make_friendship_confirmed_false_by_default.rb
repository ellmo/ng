class MakeFriendshipConfirmedFalseByDefault < ActiveRecord::Migration
  def self.up
    change_column :users_friends, :confirmed, :boolean, :default => false, :null => false
  end

  def self.down
  end
end
