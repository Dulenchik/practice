class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  before_filter :check_if_sign_in

  private
    def check_if_sign_in
      if current_user.nil?
        redirect_to admin_login_path
      end
    end

    def transform_params
      if params[:order].include?('_asc')
        params[:order].gsub(/_asc/, ' asc')
      else
        params[:order].gsub(/_desc/, ' desc')
      end
    end
end
