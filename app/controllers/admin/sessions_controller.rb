class Admin::SessionsController < ApplicationController
  skip_before_filter :check_if_sign_in

  def new
    render "new", layout: "login"
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password]) && user.user_type_id == 1
      user_session = UserSession.where(user_id: user.id, end: nil).last
      UserSession.create(start: Time.now, user_id: user.id)  if user_session.nil?
      sign_in(user)
      flash[:note] = "Welcome!"
      redirect_to admin_dashboard_path
    else
      flash[:note] = "Access denied"
      render 'new', layout: "login"
    end    
  end

  def destroy
    user_session = UserSession.where(user_id: current_user, end: nil).last
    unless user_session.nil?
      user_session.end = Time.now
      user_session.save
    end
    sign_out
    flash[:note] = "You logged out successfully"
    redirect_to admin_login_path
  end
end
