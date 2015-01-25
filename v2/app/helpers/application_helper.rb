module ApplicationHelper
  include AutoHtml
  include TweetButton
  
  def embed_media(url)
    auto_html(url) { youtube(width: 480, height: 360) }
  end
  
  def admin?
    current_user.classification == "administrator" if signed_in?
  end
  
  def content_tag_if(condition, tag, content, options={}, &block)
      content_tag(tag, content, options) unless !condition
  end
  
  def is_active?(path)
    "active" if current_page?(path)
  end
  
  def icon(name, content)
    raw("<i class=\"icon-#{name}\"></i> ") + content
  end
    
end
