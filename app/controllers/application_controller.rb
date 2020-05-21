class ApplicationController < ActionController::Base
  helper_method :current_user, :sign_in?, :require_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_in?
    !(current_user.nil? or current_user == false)
  end

  def require_user
    return if sign_in?

    flash[:alert] = 'You must be logged in to perform that action'
    redirect_to login_path
  end
end
