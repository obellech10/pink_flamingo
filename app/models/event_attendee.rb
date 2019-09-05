class EventAttendee < ApplicationRecord
  belongs_to :user
  belongs_to :event

  enum rsvp: ["Not this time", "Not sure yet", "I'll be there"]
end
