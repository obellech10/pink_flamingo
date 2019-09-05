class User < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :address
  validates_presence_of :city
  validates_presence_of :state
  validates_presence_of :zip
  validates_presence_of :email

  has_many :events
  has_many :event_attendees
end
