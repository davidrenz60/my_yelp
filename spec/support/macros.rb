def set_current_user(user=nil)
  session[:user_id] = (user || Fabricate(:user)).id
end

def clear_current_user
  session[:user_id] = nil
end

def sign_in(user=nil)
  user ||= Fabricate(:user)
  visit login_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_button "Log In"
end
