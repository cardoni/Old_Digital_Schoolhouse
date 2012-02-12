require 'open-uri'
require 'json'
require 'uri'
require 'flickraw'



class ArticlesController < ApplicationController
  # GET /articles
  # GET /articles.json
  
  FlickRaw.api_key="38f6460e9bb67f7ec0b078eff4841b6c"
  FlickRaw.shared_secret="f17739267c5e29a6"
  @photo = flickr.photos.getRecent
  # list.each {|photo| puts "'#{photo.title}' id=#{photo.id} secret=#{photo.secret}" }
  
  # http://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
  def photo
    list = flickr.photos.getRecent
    list.
    
    return list
    # id     = list[0].id
    # secret = list[0].secret
    

    # @photo = "http://farm8.staticflickr.com/7159/6860895969_492e5596bb.jpg"
  end

  def photo_id
    list = flickr.photos.getRecent
    count = flickr.photos.getRecent.count
    count.times do |entry|
      list[entry].id
    end
  end
  
  def public
    @articles = Article.all
    
    
    # @article = Article.find(params[:id])
    @youtube_id = "l7L3udkuky0"# video_id_for(article.attachment_URL) 
    
    
    
    
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
  
    def updateAttachmentURL(id)
      logger.info("-------------------  id.class: #{id.class}")
    @article.attachment_URL = ""
    a = id[:article]
    b = a[:yt_url]
    if b.blank? then
      @article.attachment_URL = id[:article][:image_url]
    else
      @article.attachment_URL = id[:article][:yt_url]
    end
    end
  
  def index
    @articles = Article.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @articles }
    end
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @article }
    end
  end

  # GET /articles/new
  # GET /articles/new.json
  def new
    @article = Article.new
    @user = User.find_by_id(session[:user_id])
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @article }
    end
    
    # def uri?(attachment_url)
    #   uri = URI.parse(attachment_url)
    #   %w( http https ).include?(uri.scheme)
    # rescue URI::BadURIError
    #   false
    # end
    # 
    #
  end

  # GET /articles/1/edit
  def edit
    @article = Article.find(params[:id])
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(params[:article])
    updateAttachmentURL(params[:article])
    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_public_url, notice: 'Article was successfully created.' }
        format.json { render json: @article, status: :created, location: @article }
      else
        format.html { render action: "new" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /articles/1
  # PUT /articles/1.json
  def update
    @article = Article.find(params[:id])
    updateAttachmentURL(params)
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to articles_public_url, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
