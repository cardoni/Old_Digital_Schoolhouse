class User < ActiveRecord::Base
  # require 'carrierwave/orm/activerecord'
  # mount_uploader :avatar, AvatarUploader
  has_many :posts
  # has_many :attachments
  has_many :assets
  has_secure_password
  belongs_to :country
  
  attr_accessor :avatar_cache, :remove_avatar
  attr_accessible :name, :email, :password, :password_confirmation, :password_digest, :school, :bio, :classification, :country_id
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, email_format: {message: 'is not looking good'},
    uniqueness: true    
end
