require 'open-uri'
require 'json'
require 'uri'
require 'flickraw'



class PostsController < ApplicationController
  # GET /posts
  # GET /posts.json
  
  FlickRaw.api_key="38f6460e9bb67f7ec0b078eff4841b6c"
  FlickRaw.shared_secret="f17739267c5e29a6"

  def photo
    list   = flickr.photos.getRecent

    id     = list[0].id
    secret = list[0].secret
    @photo = "http://farm8.staticflickr.com/7159/6772693145_e2e27ae2df.jpg"
  end

  def photo_id
    list = flickr.photos.getRecent
    count = flickr.photos.getRecent.count
    count.times do |entry|
      list[entry].id
    end
  end
  
  def public
    
    def regex
      /youtu(.be)?(be.com)?.*(?:\/|v=)([\w-]+)/
    end

    def video_id_for(url)
      url.match(regex) do
        $3
        # raise $3.inspect
      end
    end
    
    @uri = URI("http://www.youtube.com/watch?v=ZmuMgXN-ca8&feature=g-vrec&context=G216858dRVAAAAAAAAAA")
    
    source = "TheGlobalPlayground"
    channel = JSON.parse(open("http://gdata.youtube.com/feeds/api/videos?&author=#{source}&alt=json").read)
    @videos = channel["feed"]["entry"]
    # @video_thumb = channel["feed"]["entry"]["media$group"]["media$content"]
    # x=channel["feed"]["entry"][0]["media$group"]["media$player"][0]["url"].to_s
    # raise x
    count = channel["feed"]["entry"].count
    # raise count.inspect
    
    @video_ids = []
    count.times do |entry|
      @video_ids << video_id_for(channel["feed"]["entry"][entry]["media$group"]["media$player"][0]["url"])
    end
    # raise @video_ids.inspect
    
    @video_id = video_id_for(channel["feed"]["entry"][0]["media$group"]["media$player"][0]["url"])
    # raise channel["feed"]["entry"]["media$group"]["media$player"].inspect
    # raise @videos.inspect
    # raise channel["feed"]["entry"][0]["media$group"]["media$player"].inspect
    # raise @video_id.inspect
  end

  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end
  

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
end
