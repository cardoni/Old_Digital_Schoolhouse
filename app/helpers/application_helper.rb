module ApplicationHelper
  include AutoHtml
  
  def embed_media(url)
    auto_html(url) { youtube(:width => 400, :height => 250) }
  end
  
end
