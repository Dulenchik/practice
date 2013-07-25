module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:user] = [user.id, user.name]
    self.current_user = user
  end

  def sign_out
    cookies.delete :user
    self.current_user = nil 
  end

  def current_user
    @current_user ||= User.find(cookies.signed[:user].first) unless cookies.signed[:user].nil?
  end

  def current_user=(user)
    @current_user = user
  end
end
