class User < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, AvatarUploader
  has_many :posts
  has_many :attachments
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true

end
