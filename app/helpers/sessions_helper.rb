module SessionsHelper

  def sign_in(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

#I think this part initializes the current_user variable and is a one-off Ruby thing
  def current_user=(user)
    @current_user = user
  end

#then, this is the part that assigns current_user ONLY IF unassigned
  def current_user
    @current_user ||= User.find_by_remember_token(cookies[:remember_token])
  end

  def sign_out
    self.current_user = nil
    cookies.delete(:remember_token)
  end
  
end