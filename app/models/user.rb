class User < ApplicationRecord
  # validates_presence_of :first_name
  # validates_presence_of :last_name
  # validates_presence_of :address
  # validates_presence_of :city
  # validates_presence_of :state
  # validates_presence_of :zip
  # validates_presence_of :email

  has_many :events
  has_many :event_attendees
  has_many :credentials

  def self.create_with_omniauth(auth)
    create(first_name: auth[:extra][:raw_info][:name])
  end

  def self.from_omniauth(auth)
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end
end
