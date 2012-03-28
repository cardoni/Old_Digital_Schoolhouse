class Asset < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  has_many :attachments, :dependent => :destroy
  has_many :posts , :through => :attachments
  belongs_to :user
  attr_accessible :type, :user_id, :image ###### FOOBARRRRREDDD
  
  image_df_accessor :image  # do
  #   storage_path :path_for_attachment
  # end
  # # The method below defines the path where an image is stored up in S3
  # def path_for_attachment
  #   "#{Time.now.strftime '%Y/%m'}/#{rand(100)}"
  # end
  
  def to_jq_upload
      {
        "name" => read_attribute(:image_name),
        "size" => image.size,
        "url" => image.remote_url,
        "thumbnail_url" => image.thumb('80x80').url,
        # "delete_url" => asset_path(:id => id),
        #         "delete_type" => "DELETE" 
      }
    end
end
