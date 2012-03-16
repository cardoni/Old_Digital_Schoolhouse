class Post < ActiveRecord::Base
  # The following generates SEO-friendly URL slugs
  extend FriendlyId
  friendly_id :title, use: :slugged
    
  has_many :attachments, :dependent => :destroy
  has_many :assets, :through => :attachments
  
  belongs_to :user
  
  accepts_nested_attributes_for :attachments, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  include AutoHtml
    auto_html_for :body do
      html_escape
      youtube(width: 480, height: 360)
      image
      link(target: "_blank", rel: "nofollow")
      simple_format
    end
end
