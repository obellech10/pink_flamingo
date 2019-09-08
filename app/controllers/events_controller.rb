class EventsController < ApplicationController
  before_action :check_authorized_user

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
    render locals: {
      facade: LocalEventsFacade.new("5073 Valentia St, Denver, CO 80238", "8393 Beekman Pl, Denver, CO 80216")
    }
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

    def check_authorized_user
      render file: 'public/404', status: 404 unless !current_user.address.nil?
    end
end
