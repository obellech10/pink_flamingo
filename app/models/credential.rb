class Credential < ApplicationRecord
  validates_presence_of :uid
  validates_presence_of :provider
  validates_presence_of :token

  belongs_to :user

  def self.find_or_create_by_omniauth(auth)
    if auth["provider"] == "facebook"
      info = "credentials"
    else
      info = "info"
    end

    find_or_create_by(
      uid: auth["uid"],
      provider: auth["provider"],
      token: auth["#{info}"]["token"]
      )
  end
end
