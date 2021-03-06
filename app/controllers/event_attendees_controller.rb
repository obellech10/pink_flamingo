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
    end
    redirect_to event_path(@event)
  end

  def update
    event = Event.find(params[:event_id])
    attendee = event.event_attendees.find_by(user_id: current_user.id)
    attendee.update(rsvp: params[:rsvp].to_i)
    attendee.update(number_of_guests: params[:number_of_guests].to_i)
    if attendee.save
      flash[:success] = "RSVP updated"
      redirect_to event_path(event)
    end
  end
end
