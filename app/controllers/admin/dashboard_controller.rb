class Admin::DashboardController < ApplicationController
  def index
    @caption = "Dashboard"
    @users = User.where("created_at > ?", current_user.user_sessions.last(2).first.end)
    @microposts = Micropost.where("created_at > ?", current_user.user_sessions.last(2).first.end)
  end
end
