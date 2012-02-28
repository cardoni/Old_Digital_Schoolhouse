class User < ActiveRecord::Base
  require 'carrierwave/orm/activerecord'
  mount_uploader :avatar, AvatarUploader
  has_many :posts
  has_many :attachments
  has_secure_password

  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, :email_format => {:message => 'is not looking good'},
    uniqueness: true

end
