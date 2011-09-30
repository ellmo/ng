class FriendController < ApplicationController
  before_filter :authenticate_user!

  def index
  end

  def add_friend
    logger.info params.inspect 
  end

  def confirm_friend_request
    @friend = User.find(params[:friend][:user_id])
    logger.info @friend.inspect
    UsersFriend.create({:user_id => current_user.id, :friend_id => @friend.id})
    @notice
    redirect_to(root_path, :notice => "friend request sent")
  end

  def confirm_friendship
  end

  def remove_friend
  end

end
