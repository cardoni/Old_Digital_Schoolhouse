class ArticlesController < ApplicationController

def public
  @articles = Article.all
end

# Update the 'attachment_URL' field with the URL to the asset
def updateAttachmentURL(id)
  @article.attachment_URL = ""
  if id[:article][:yt_url].present? then
    @article.attachment_URL = id[:article][:yt_url]
  else
    @article.attachment_URL = id[:article][:image_url]
  end
end

# Get the ID from a full YouTube URL
def getYTid(url)
  url.match(/youtube.com.*(?:\/|v=)(\w+)/)[1]
end

def index
  @articles = Article.all

  respond_to do |format|
    format.html
    format.json { render json: @articles }
  end
end

def show
  @article = Article.find(params[:id])

  respond_to do |format|
    format.html
    format.json { render json: @article }
  end
end

def new
  @article = Article.new
  @user = User.find_by_id(session[:user_id])
  
  respond_to do |format|
    format.html
    format.json { render json: @article }
  end
end


def edit
  @article = Article.find(params[:id])
end


def create
  @article = Article.new(params[:article])
  updateAttachmentURL(params)
  respond_to do |format|
    if @article.save
      format.html { redirect_to edit_article_path(params[:id]), notice: 'Article Created!' } # link_to('Return to homepage', article_public_url)
      format.json { render json: @article, status: :created, location: @article }
    else
      format.html { render action: "new" }
      format.json { render json: @article.errors, status: :unprocessable_entity }
    end
  end
end


def update
    @article = Article.find(params[:id])
    updateAttachmentURL(params)
    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to edit_article_path(params[:id]), notice: "<b>Success!</b><br /> Article last updated on: #{@article.updated_at}" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url }
      format.json { head :no_content }
    end
  end
end
