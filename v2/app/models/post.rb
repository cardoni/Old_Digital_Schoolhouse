class Post < ActiveRecord::Base
  # after_update :save_attachments
  
  has_many :attachments, :dependent => :destroy
  belongs_to :user
  
  accepts_nested_attributes_for :attachments, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

  
end
