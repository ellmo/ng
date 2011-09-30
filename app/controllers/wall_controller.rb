class WallController < ApplicationController
  def show
    @wall = Wall.find(params[:id])
    @posts = @wall.posts.find(:all, :order => "created_at DESC")
    @user = @wall.user
    @post = Post.new
  end
end
