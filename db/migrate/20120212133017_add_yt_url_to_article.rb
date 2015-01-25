class AddYtUrlToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :yt_url, :string
    
    add_column :articles, :image_url, :string

  end
end
