class ApplicationController < ActionController::Base

  helper_method :current_user, :sign_in?

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def sign_in?
    !!@current_user
  end
end
