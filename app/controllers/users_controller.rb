class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users/1
  # GET /users/1.json
  def show
      @created_events = @current_user.events
      #@attended_events = @user.attended_events("") # db call
      @attend_events = @current_user.attended_events
      @upcoming_events = @attend_events.upcoming_events
      @prev_events = @attend_events.previous_events
  end

  # GET /users/new
  def new
    @user = User.new
  end


  # POST /users
  # POST /users.json
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
    def set_user
      if current_user
        current_user
      else
        redirect_to login_path, alert: 'Login to access My Events'
      end
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :email)
    end

end
