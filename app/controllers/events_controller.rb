class EventsController < ApplicationController
  def new
    @event = Event.new
  end

  def create
    event = current_user.events.create(event_params)
    if event.save
      flash[:success] = "#{event.title} was created!"
      redirect_to event_path(event)
    else
      flash[:warning] = "There was an error: please try again."
      redirect_to new_event_path
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    address = @event.address
    render locals: {
      facade: EventLocationFacade.new(address)
    }
  end

  private
    def event_params
      params.require(:event).permit(:title, :date, :time, :address, :user_id, :event_type, :food, :booze, :restrictions, :radius)
    end
end
