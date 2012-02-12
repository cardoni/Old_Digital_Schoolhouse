module ArticlesHelper
<<<<<<< HEAD

=======
  
  def photo_helper(link)
    if excerpt(link, "outub", :radius => 2) == "youtube"
      "<object width=\"241\" height=\"145\">
        <param name=\"movie\" value=\"http://www.youtube.com/e/#{link}\">
        <param name=\"allowFullScreen\" value=\"true\">
        <param name=\"allowscriptaccess\" value=\"always\">
        <embed src=\"http://www.youtube.com/e/#{link}\" type=\"application/x-shockwave-flash\" width=\"241\" height=\"145\" allowscriptaccess=\"always\" allowfullscreen=\"true\">
      </object>"
    else
      image_tag(link)
    end
  end
  # @article.attachment_url 
  # if attachment_url ""
>>>>>>> 0dc4da168f82cc74e065a4aa5de48ea78751c0a7

end
