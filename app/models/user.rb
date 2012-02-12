class User < ActiveRecord::Base
<<<<<<< HEAD
  has_many :articles
  belongs_to :school
  
  has_secure_password
  
=======

  has_many :posts
  belongs_to :school

>>>>>>> 0bce1c9e3e51a3c3202306958046b232948a7335
end
