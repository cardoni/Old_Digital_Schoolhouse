class Post < ActiveRecord::Base
  # after_update :save_attachments
  
  has_many :attachments
  belongs_to :user
  
  accepts_nested_attributes_for :attachments, :allow_destroy => true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
  # def new_attachment_attributes=(attachment_attributes)
  #   attachment_attributes.each do |attributes|
  #     attachments.build(attributes)
  #   end
  # end
  # 
  # def existing_attachment_attributes=(attachment_attributes)
  #   attachments.reject(&:new_record?).each do |attachment|
  #     attributes = attachment_attributes[attachment.id.to_s]
  #     if attributes
  #       attachment.attributes = attributes
  #     else
  #       attachments.delete(attachment)
  #     end
  #   end
  # end
  # 
  # def save_attachments
  #   attachments.each do |attachment|
  #     attachment.save(false)
  #   end
  # end
  
end
