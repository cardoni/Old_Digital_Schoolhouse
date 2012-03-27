class Video < Asset
  
  def self.all_from_api
    response = Vimeo::Simple::User.videos("global").parsed_response
    response.each do |v|
      find_or_create_by_resource_id(:resource_id => v['id'], :resource_url => v['url'], :image => v['thumbnail_medium'])
    end
  end
  
end