class User < ActiveRecord::Base
<<<<<<< HEAD
  has_many :articles
  belongs_to :school
  
  has_secure_password
  
=======

  has_many :posts
  belongs_to :school

>>>>>>> public_views
end
