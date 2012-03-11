module ApplicationHelper
  include AutoHtml
  include TweetButton
  
  def embed_media(url)
    auto_html(url) { youtube(width: 480, height: 360) }
  end
  
end
