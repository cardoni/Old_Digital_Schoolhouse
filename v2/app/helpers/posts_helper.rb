module PostsHelper

  def add_attachment_link(name)
    link_to_function name do |page|
      page.insert_html :bottom, :attachments, :partial => 'attachment', :object => Attachment.new
    end
  end
  
  def provider_regex(url)
    regex = /www.(youtube)?(be.com)?.*(?:\/|v=)([\w-]+)/ #pulls out "youtube"
    url.match(regex) do
      $1
      #raise $1.inspect
    end
  end

end