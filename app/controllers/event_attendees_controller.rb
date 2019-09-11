class EventAttendeesController < ApplicationController


  def create
    @event = Event.find(params[:event_id])
    event_attendee = @event.event_attendees.new({
      user: current_user,
      rsvp: params[:rsvp].to_i,
      number_of_guests: params[:number_of_guests]
      })
    if @event.save
      flash[:success] = "Thank you for your response!"
      TwilioFacade.new.sendtext(1, current_user.phone)
    else
      flash[:error] = event_attendee.errors.full_messages.to_sentence
    end
    redirect_to event_path(@event)
  end

  def update
    event = Event.find(params[:event_id])
    attendee = event.event_attendees.find_by(user_id: current_user.id)
    attendee.update(rsvp: params["rsvp"].to_i)
    if attendee.save
      flash[:success] = "RSVP updated"
      redirect_to event_path(event)
    else
      flash[:warning] = "There was an error, please try again."
      redirect_to event_path(event)
    end
  end

end
