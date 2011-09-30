class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :login

  has_one :wall
  has_many :posts
  has_many :users_friends
  has_many :friends, :through => :users_friends

  def confirmed_friends
    friends1 = self.users_friends.select{|f| f.confirmed}.map {|f| f.friend}
    friends2 = UsersFriend.find_all_by_friend_id_and_confirmed(self.id, true).map {|f| f.user}
    return (friends1+friends2).uniq
  end

end
