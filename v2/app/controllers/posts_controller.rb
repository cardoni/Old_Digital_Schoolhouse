class PostsController < ApplicationController
  include ActionView::Helpers::TextHelper
  
  def index
    @posts = Post.find(:all, order: "created_at DESC")
    @user_posts = Post.where(user_id: current_user)
    @post = Post.find_by_id(params[:id])
    @user = User.find_by_id(current_user)
    @title = "#{@user.name}\'s Posts"
    # @posts.attachments = Attachment.find_by_id(params[:post_id])
    # @attachments = Attachment.find(:all, :order => "created_at DESC")
  end

  def new
    @post = Post.new

  end

  def edit
    @post = Post.find(params[:id])

  end
  
  def create
    @post = Post.new(params[:post])
    @post.save
    # NewPostMailer.new_post.deliver
    redirect_to posts_url, notice: 'Congratulations! You just created a post!'
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to posts_url, notice: 'Success! Your post was successfully updated!'
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    old_title = @post.title
    @post.destroy
    redirect_to root_url, notice: 'You\'ve just deleted the post: ' + raw("<br />") + old_title
  end
  
  def show
    if Post.find_by_slug(params[:id]).nil?
      redirect_to root_url, notice: 'Sorry, that page couldn\'t be found.'
    else
      @post = Post.find(params[:id])
      @title = @post.title
      @description = truncate(@post.body, length: 120, seperator: ' ')
    end
  end

end

