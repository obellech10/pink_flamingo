class User < ApplicationRecord
  validates_presence_of :name

  has_many :events, dependent: :destroy
  has_many :event_attendees, dependent: :destroy 
  has_many :credentials, dependent: :destroy


  def self.create_with_omniauth(auth)
    if auth[:provider] == "facebook"
      find_or_create_by(name: auth[:extra][:raw_info][:name])
    else
      find_or_create_by(name: auth[:info][:name])
    end
  end

  def add_credential(provider, auth)
    credentials.find_or_create_by_omniauth(auth)
  end
end
