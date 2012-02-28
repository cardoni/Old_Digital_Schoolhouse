module PostsHelper
  
  def provider_regex(url)
    regex = /www.(youtube)?(be.com)?.*(?:\/|v=)([\w-]+)/ #pulls out "youtube"
    url.match(regex) do
      $1
      #raise $1.inspect
    end
  end

end