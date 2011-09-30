class FrontendController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]

  def index
    if user_signed_in?
      @wall = current_user.wall
      @post = Post.new
      @posts = @wall.posts.find(:all, :order => "created_at DESC")
    end
  end

  def search 
    para = params["search"]#.reject! { |k,v| v.blank? }
    logger.info para.inspect
    redirect_to search_results_path(para)
  end

  def search_results
    request.parameters.reject! {|p| p == "authenticity_token"}
    @users = User.find(:all, :conditions => ["login LIKE ?", "%#{params[:s]}%"])
    logger.info @users.inspect
  end

end
