class Video < ActiveRecord::Base
  has_one :attachment, :as => :media
end
