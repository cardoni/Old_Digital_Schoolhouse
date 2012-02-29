class Post < ActiveRecord::Base
  # after_update :save_attachments
  
  has_many :attachments, :dependent => :destroy
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
