class HomeController < ApplicationController
  skip_before_filter :login_user!
  def index
    @posts = Post.find(:all, :order => "created_at desc")
    @title = "Digital Schoolhouse"
    countries = Country.all.sample(3)
    # user_ids = countries[0].users.select(:id)
    # @posts_01 = Post.select(:id).where(:user_id => user_ids)
    # @posts_01 = Post.where(:user_id => user_ids).limit(1)
    # @posts_01 = Post.where(:user_id => user_ids)
    # user_ids = countries[1].users.select(:id)
    # @posts_02 = Post.where(:user_id => user_ids)
    # user_ids = countries[2].users.select(:id)
    # @posts_03 = Post.where(:user_id => user_ids)
    @array_of_post_arrays = Array.new
    countries.each do |country|
      user_ids = country.users.select(:id)
      # array: 
      @array_of_post_arrays.push(Post.where(:user_id => user_ids))
      # hash: @array_of_post_arrays[country.name] = Post.where(:user_id => user_ids)
    end

  end
  
  def about
    @users = User.all
    @title = "About Digital Schoolhouse"
  end

end
