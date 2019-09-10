class EventAttendee < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates :number_of_guests, numericality: { greater_than: 0, less_than_or_equal_to: 10 }

  enum rsvp: ["Not this time!", "Not sure yet!", "I'll be there!"]

  def self.attendees(event)
    joins(:user)
    .where("event_attendees.event_id = ?", "#{event.id}")
    .select("event_attendees.*")
    .select("users.name")
    .group(:id, "users.name")
  end
end
