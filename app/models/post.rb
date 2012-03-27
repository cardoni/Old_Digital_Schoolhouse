class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, :use => :slugged
  # image_df_accessor :image
  # include PostsHelper
    
  has_many :attachments, :dependent => :destroy
  has_many :assets, :through => :attachments
  has_many :images, :through => :attachments, :source => :image
  has_many :videos, :through => :attachments, :source => :video
  
  belongs_to :user

  # def initialized_attachments(id)
  # [].tap do |o|
  #     Asset.where(:user_id => id).each do |asset|
  #     if a = attachments.find { |a| a.asset_id == asset.id }
  #       o << a.tap { |a| a.enable ||= true }
  #     else
  #       o << Attachment.new(asset: asset)
  #     end
  #   end
  # end

  include AutoHtml
    auto_html_for :body do
      html_escape
      youtube(width: 480, height: 360)
      image
      link(target: "_blank", rel: "nofollow")
      simple_format
    end
    

end
