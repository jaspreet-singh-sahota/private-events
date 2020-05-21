class UsersController < ApplicationController
  before_action :require_user, only: %i[show edit update destroy]

  def show
    @created_events = @current_user.events
    # @attended_events = @user.attended_events("") # db call
    @attend_events = @current_user.attended_events
    @upcoming_events = @attend_events.upcoming_events
    @prev_events = @attend_events.previous_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
