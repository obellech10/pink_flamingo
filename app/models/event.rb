class Event < ApplicationRecord
  validates_presence_of :date
  validates_presence_of :time
  validates_presence_of :address
  validates_presence_of :user_id
  validates_presence_of :radius

  belongs_to :user
  has_many :event_attendees, dependent: :destroy
end
