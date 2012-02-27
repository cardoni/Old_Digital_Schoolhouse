class Attachment < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :photo, PhotoUploader
  
  def photo=(val)
    if !val.is_a?(String) && valid?
      photo_will_change!
      super
    end
  end
  
  belongs_to :post
  belongs_to :user
  
  
  
end
