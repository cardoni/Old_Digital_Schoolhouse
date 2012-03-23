class AssetsController < ApplicationController
  
  def index
    if current_user.classification == 'administrator'
      @assets = Asset.find(:all, order: "created_at DESC")
    else
      @assets = Asset.where(:user_id => current_user.id).order("created_at DESC")
    end
    @user_assets = Asset.where(:user_id => current_user.id)
    @asset = Asset.new
    respond_to do |format|
      format.html
      format.json { render :json => @assets.collect { |a| a.to_jq_upload }.to_json }
    end
  end
  
  def create
    @asset = Asset.new(params[:asset])
    if @asset.save
      respond_to do |format|
        format.html {
          render :json => [@asset.to_jq_upload].to_json,
          :content_type => 'text/html',
          :layout => false
        }
        format.json {
          render :json => [@asset.to_jq_upload].to_json
        }
      end
    else
      render :json => [{:error => "custom_failure"}], :status => 304
    end
  end
  
  def destroy
    @asset = Asset.find(params[:id])
    @asset.destroy
    render :json => true
  end
end
