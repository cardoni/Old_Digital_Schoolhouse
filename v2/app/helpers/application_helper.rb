module ApplicationHelper
  include AutoHtml
  include TweetButton
  
  def embed_media(url)
    auto_html(url) { youtube(width: 480, height: 360) }
  end
  
  def admin?
    current_user.classification == "administrator" if signed_in?
  end
  
end
