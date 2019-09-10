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
    else
      flash[:error] = event_attendee.errors.full_messages.to_sentence  
    end
    redirect_to event_path(@event)
  end
end
