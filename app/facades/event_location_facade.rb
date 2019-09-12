class EventLocationFacade
  attr_reader :address, :id

  def initialize(address, id)
    @address = address
    @id = id
  end

  def key_location
    "#{ENV['GOOGLE_API_KEY']}&q=#{address}"
  end

  def specific_event
    Event.find(@id)
  end

  def event_attendees
    EventAttendee.attendees(specific_event)
  end

end
