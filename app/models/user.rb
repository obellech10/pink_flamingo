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

  def self.create_with_omniauth(auth)
    user = find_or_create_by(uid: auth["uid"], provider:  auth["provider"])
    user.email = "#{auth["uid"]}@#{auth["provider"]}.com"
    user.password = auth["uid"]
    user.name = auth["info"]["name"]
    if User.exists?(user)
      user
    else
    user.save!
    user
    end
  end
end
