class SessionsController < ApplicationController
before_action :set_session, only: [:destroy]

  def new

  end

  def create
    byebug
    @user = User.find_by(email:(params[:session][:email]))
    if @user != nil
      session[:user_id] = @user.id
      flash[:notice] = "Logged in Successfully"    
    else
      flash.now[:notice] = "Worng Email Id"
      render 'new'
    end
  end



  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_session
    @session = Session.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def session_params
    params.permit(:email)
  end
end 