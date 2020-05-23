class UsersController < ApplicationController
  before_action :require_user, only: %i[show edit update destroy]

  def show
    @created_events = @current_user.events
    @attend_events = @current_user.attended_events
    @upcoming_events = @attend_events.upcoming_events
    @prev_events = @attend_events.previous_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'User was successfully created and logged in'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
