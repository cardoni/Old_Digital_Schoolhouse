def sign_in(user)
  visit login_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Sign In"
  # Sign in when not using Capybara as well.
  session[:user] = user.id
end
