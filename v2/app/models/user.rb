class User < ActiveRecord::Base
  has_many :articles
  belongs_to :school
end
