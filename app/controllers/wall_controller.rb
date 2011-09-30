class WallController < ApplicationController
  def show
    @wall = Wall.find(params[:id])
    @user = @wall.user
    @post = Post.new
  end
end
