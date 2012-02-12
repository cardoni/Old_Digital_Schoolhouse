class Article < ActiveRecord::Base
  
  belongs_to :user
  validate :article_title, :presence => true  #originally said "validates?" --greg
  validate :article_body_or_attachment_URL
  
  # extend FriendlyId
  #   friendly_id :article_title, use: :slugged
  
  def article_body_or_attachment_URL
    if article_body.blank? and attachment_URL.blank?
      errors.add :base, "Please fill in either body or URL"
      return false
      else
      return true
    end
  end

  # validate :url_tests
  
  # def url_tests
  #   if attachment_URL.present? and attachment_Credits.blank?
  #     errors.add :base, "Please give credit for your attachment!"
  #     return false
  #   else
  #     if attachment_URL.blank? and attachment_Credits.present? 
  #       errors.add :base, "Do not add credits unless you are providing a URL"
  #       return false
  #     else
  #       if attachment_URL.blank? and attachment_Description.present? 
  #         errors.add :base, "Do not add a description unless you are providing a URL"
  #         return false
  #       else
  #     return true
  #   end
  #   end
  #   end
  # end

    # validates_format_of :attachment_URL, :with => URI::regexp(%w(http https)), :allow_blank => true

  # validate :tags
  #   
  #   def tags
  #     if article_tags.split(",").count < 3
  #       errors.add(:article_tags, "Please make sure you have at least 3 comma separated tags")
  #       return false
  #     else
  #       return true
  #     end
  #   end
  
end
