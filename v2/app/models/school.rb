class School < ActiveRecord::Base
<<<<<<< HEAD
  has_many :users
=======

  has_many :users
  has_many :posts :through => :users

>>>>>>> public_views
end
