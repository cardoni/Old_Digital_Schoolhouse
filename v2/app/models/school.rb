class School < ActiveRecord::Base

  has_many :users
  has_many :posts :through => :users

end
