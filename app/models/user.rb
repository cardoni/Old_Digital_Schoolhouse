class User < ActiveRecord::Base
  has_many :articles
  belongs_to :school
  
  has_secure_password
  
end
