module SessionsHelper

  def current_user
    @current_user ||= User.find_by_id(session[:user])
  end
  
  def sign_in(user)
    session[:user] = user.id
  end
  
  def current_user?
    current_user.present?
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def login_user!
    if current_user.nil?
      redirect_to login_url
    end
  end
  
  def admin_user?
    if  current_user.classification != 'administrator'
      redirect_to root_url,  notice: "Only admins can see this page"
    end   
  end
  

end