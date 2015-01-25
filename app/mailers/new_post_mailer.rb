class NewPostMailer < ActionMailer::Base
  
  default from: "info@globalplayground.org"
  default to: "subscribers@globalplayground.org"
  
  def new_post
    mail(:subject => "Digital Schoolhouse Update!")
  end
       
end
