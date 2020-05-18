class ApplicationController < ActionController::Base
  def current_user 
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def sign_in?
    !!@current_user
  end
end
