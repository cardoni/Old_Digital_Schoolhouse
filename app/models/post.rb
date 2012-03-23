class Post < ActiveRecord::Base
  # The following generates SEO-friendly URL slugs
  extend FriendlyId
  friendly_id :title, use: :slugged
  # image_df_accessor :image
  # include PostsHelper
    
  has_many :attachments, :dependent => :destroy
  has_many :assets, :through => :attachments
  
  belongs_to :user
  
  accepts_nested_attributes_for :attachments, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

    def initialized_attachments(id)
      logger.debug("--------------------------------------User id: ")
      
      logger.debug("-------------------------------------- ")
    [].tap do |o|
        Asset.where(:user_id => id).each do |asset|
        if a = attachments.find { |a| a.asset_id == asset.id }
          o << a.tap { |a| a.enable ||= true }
        else
          o << Attachment.new(asset: asset)
        end
      end
    end
  end

  include AutoHtml
    auto_html_for :body do
      html_escape
      youtube(width: 480, height: 360)
      image
      link(target: "_blank", rel: "nofollow")
      simple_format
    end
    
    def vimeo_response
      vim = Vimeo::Simple::User.videos("global").parsed_response
      b = vim.each do |vid_attr|
        build(:attachment_url => vid_attr['id'], :provider => vid_attr['thumbnail_small'])
      end
      [].tap do |o|
        b.each do |asset|
          if a = attachments.find { |a| a.provider == asset.provider }
            o << a.tap { |a| a.enable ||= true }
          else
            o << Attachment.new(b: asset)
          end
        end
      end
    end

end
