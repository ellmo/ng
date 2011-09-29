class FriendController < ApplicationController
  def index
  end

  def add_friend
    logger.info params.inspect
  end

  def remove_friend
  end

end
