class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example
    user ||= User.new # guest user (not logged in)
    if user.id
      can :read, Wall
      can :read, Post
      can :create, Post do |p|
        p.wall.user == user or user.confirmed_friends.include?(p.wall.user)
      end
    end
  end
end
