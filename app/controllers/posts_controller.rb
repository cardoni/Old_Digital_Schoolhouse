class PostsController < ApplicationController
  before_filter :process_attachment_attrs, only: [:create, :update]
  
  def process_attachment_attrs
    params[:post][:attachments_attributes].values.each do |attach_attr|
      attach_attr[:_destroy] = true if attach_attr[:enable] != '1'
    end
  end
  
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
    @vimeo = Vimeo::Simple::User.videos("global").parsed_response
    @vimeo.each do |vid_attr|
      @post.attachments.build(:attachment_url => vid_attr['thumbnail_small'], :provider => vid_attr['id'])
    end
  end

  def edit
    @post = Post.find(params[:id])
    # @post.attachments.where('attachment_url IS NOT NULL').build(:attachment_url => attachment_url)
  end
  
  def create
    @post = Post.new(params[:post])   
    @post.save
    NewPostMailer.new_post.deliver
    redirect_to posts_url
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post])
      redirect_to posts_url
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_url
  end
  
  def show
    @post = Post.find(params[:id])
    @title = @post.title
  end

end

