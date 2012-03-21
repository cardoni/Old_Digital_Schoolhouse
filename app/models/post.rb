class Post < ActiveRecord::Base
  # The following generates SEO-friendly URL slugs
  extend FriendlyId
  friendly_id :title, use: :slugged
  # image_df_accessor :image
    
  has_many :attachments, :dependent => :destroy
  has_many :assets, :through => :attachments
  
  belongs_to :user
  
  accepts_nested_attributes_for :attachments, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  def initialized_attachments
    [].tap do |o|
        Asset.find_all_by_user_id(@current_user).each do |asset|
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
end
