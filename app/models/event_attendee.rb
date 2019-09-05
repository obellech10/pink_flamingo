class EventAttendee < ApplicationRecord
  validates_presence_of :rsvp

  belongs_to :user
  belongs_to :event
end
