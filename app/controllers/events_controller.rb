class EventsController < ApplicationController
  before_action :check_authorized_user

  def new
    @event = Event.new
  end

  def create
    event = current_user.events.create(event_params)
    if event.save
      flash[:success] = "#{event.title} was created!"
      TwilioFacade.new.sendtext(0, current_user.phone)
      redirect_to event_path(event)
    else
      flash[:error] = "There was an error: please try again."
      redirect_to new_event_path
    end
  end

  def edit
    @event = Event.find([params[:id]])
  end

  def index
    @events = Event.all
    render locals: {
      facade: LocalEventsFacade.new
    }
  end

  def update
    @event = Event.find(params[:id])
    if current_user.id == @event.user_id
      @event.update(event_params)
      redirect_to event_path(@event)
    else
      render file: 'public/404', status: 404
    end
  end

  def show
    @event = Event.find(params[:id])
    address = @event.address
    render locals: {
      facade: EventLocationFacade.new(address, params[:id])
    }
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    flash[:success] = "Your event has been deleted."
    TwilioFacade.new.sendtext(2, current_user.phone)
    redirect_to events_path
  end

  private
    def event_params
      params.require(:event).permit(:title, :date, :time, :address, :user_id, :event_type, :food, :booze, :restrictions, :radius)
    end

    def check_authorized_user
      render file: 'public/404', status: 404 unless !current_user.address.nil?
    end
end
