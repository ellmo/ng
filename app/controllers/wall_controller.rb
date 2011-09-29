class WallController < ApplicationController
  def show
    @posts = Wall.find(params[:id]).posts
  end
end
