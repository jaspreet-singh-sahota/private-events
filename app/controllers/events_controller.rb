class EventsController < ApplicationController
  before_action :set_event, only: %i[show register_event edit update destroy]
  before_action :require_user, only: %i[register_event new edit]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
    @previous_events = @events.previous_events
    @upcoming_events = @events.upcoming_events
  end

  def register_event
    if @event.attendees << @current_user
      redirect_to root_path, notice: 'Registered for the event successfully.'
    else
      redirect_to root_path, alert: 'Unable to Register for the event.'
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @users = @event.attendees
    return unless sign_in?

    @not_registered = true if @users.where(id: @current_user.id)[0].nil?
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit; end

  # POST /events
  # POST /events.json
  def create
    redirect_to login_path if session[:user_id].nil?
    @current_user = User.find(session[:user_id])
    @event = @current_user.events.build(event_params)
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_event
    @event = Event.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def event_params
    params.require(:event).permit(:title, :description, :event_date)
  end
end
