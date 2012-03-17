class Attachment < ActiveRecord::Base
  # require 'carrierwave/orm/activerecord'
  
  belongs_to :post
  belongs_to :user
  belongs_to :asset
  
  attr_accessor :enable
  
  # mount_uploader :photo, PhotoUploader
  
  # def photo=(val)
  #   if !val.is_a?(String) && valid?
  #     photo_will_change!
  #     super
  #   end
  # end
  
end
