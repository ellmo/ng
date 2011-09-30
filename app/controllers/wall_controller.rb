class WallController < ApplicationController
  def show
    @wall = Wall.find(params[:id])
    @post = Post.new
  end
end
