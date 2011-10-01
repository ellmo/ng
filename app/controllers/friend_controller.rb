class FriendController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def add_friend
    @friend = User.find(params[:friend])
    if current_user == @friend  
      redirect_to root_path, :notice => "Forever alone?"
    elsif current_user.confirmed_friends.include?(@friend)
      redirect_to root_path, :notice => "You're friends already!"
    elsif current_user.friend_requests_pending.map{|f| f.user}.include?(@friend)
      redirect_to root_path, :notice => "This user has already sent you an invitation!"
    elsif current_user.friends.include?(@friend)
      redirect_to root_path, :notice => "You have already sent an invitation!"
    end
    #logger.info @friend.inspect 
  end

  def confirm_friend_request
    @friend = User.find(params[:friend][:user_id])
    logger.info @friend.inspect
    UsersFriend.create({:user_id => current_user.id, :friend_id => @friend.id})
    redirect_to(root_path, :notice => "Friend request sent.")
  end

  def confirm_friendship
    @friendship = UsersFriend.find(params[:friendship][:id])
    @friend = User.find(@friendship.user.id)
    if current_user == @friend
      redirect_to root_path, :notice => "Forever alone?"
    elsif current_user.friend_requests_pending.include?(@friendship)
      @friendship.confirmed = true
      @friendship.save
      redirect_to root_path, :notice => "You and #{@friend.login} are friends now!"
    else
      @friendship.destroy
      redirect_to root_path, :notice => "Duplicate friend invitation removed."
    end
  end

  def remove_friend
  end

end
