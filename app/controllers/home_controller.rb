class HomeController < ApplicationController
  skip_before_filter :login_user!
  def index
    @posts = Post.find(:all, :order => "created_at desc")
    @title = "Digital Schoolhouse"
    countries = Country.all.sample(3)
    @array_of_post_arrays = Hash.new
    countries.each do |country|
      user_ids = country.users.select(:id)
      @array_of_post_arrays[country.name] = Post.where(:user_id => user_ids)
    end

  end
  
  def about
    @users = User.all
    @title = "About Digital Schoolhouse"
  end

end
