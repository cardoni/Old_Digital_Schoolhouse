class School < ActiveRecord::Base
<<<<<<< HEAD
  has_many :users
=======

  has_many :users
  has_many :posts :through => :users

>>>>>>> 0bce1c9e3e51a3c3202306958046b232948a7335
end
