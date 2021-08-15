class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token ##required for APIs

    before_action :fetch_user

    helper_method :logged_in?, :current_user

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      @current_user.present?
    end

    private
    def fetch_user
      @current_user = User.find_by :id => session[:user_id] if session[:user_id].present?
      session[:user_id] = nil unless @current_user.present? # Log out non-existent users.
    end

    def check_for_login
      unless @current_user.present?
        flash[:error] = "You must be logged in"
        redirect_to login_path
      end
    end

    def check_for_admin
      redirect_to login_path unless (@current_user.present? && @current_user.admin?)
      end
  end
