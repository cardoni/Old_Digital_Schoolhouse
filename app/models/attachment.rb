class Attachment < ActiveRecord::Base
  belongs_to :article
  belongs_to :media, :polymorphic => true
  
end
