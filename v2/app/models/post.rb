class Post < ActiveRecord::Base
  has_many :attachments
  belongs_to :user
end
