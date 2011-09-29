class CreateUsersFriends < ActiveRecord::Migration
  def self.up
    create_table :users_friends do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users_friends
  end
end
