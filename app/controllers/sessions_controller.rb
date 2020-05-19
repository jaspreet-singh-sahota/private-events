class SessionsController < ApplicationController

  def new

  end

  def create
    @user = User.find_by(email:(params[:session][:email]))
    if @user != nil
      session[:user_id] = @user.id
      flash[:notice] = "User logged in successfully"
      redirect_to root_path
    else
      flash.now[:alert] = "Worng Email Id"
      render 'new'
    end
  end



  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'User logged out successfully ' }
      format.json { head :no_content }
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def session_params
    params.permit(:email)
  end
end 