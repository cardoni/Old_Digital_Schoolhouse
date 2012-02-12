class Post < ActiveRecord::Base

  belongs_to :users
  has_many :attachments
  
end
