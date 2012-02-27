class HomeController < ApplicationController
  skip_before_filter :login_user!
  def index
    @posts = Post.find(:all, :order => "created_at desc")
  end
  
  def about
    @users = User.all
  end

end