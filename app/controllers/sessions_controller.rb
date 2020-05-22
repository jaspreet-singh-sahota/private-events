class SessionsController < ApplicationController
  def new
    return unless sign_in?

    flash[:notice] = 'User logged already'
    redirect_to root_path
  end

  def create
    @user = User.find_by(email: (params[:session][:email]))
    if !@user.nil?
      session[:user_id] = @user.id
      flash[:notice] = 'User logged in successfully'
      redirect_to root_path
    else
      flash.now[:alert] = 'Worng Email Id'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'User logged out successfully '
  end

  private

  def session_params
    params.permit(:email)
  end
end
