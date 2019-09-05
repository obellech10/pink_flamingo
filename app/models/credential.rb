class Credential < ApplicationRecord
  belongs_to :user

  def self.find_or_create_by_omniauth(auth)
    find_or_create_by(uid: auth["uid"], provider: auth["provider"], token: auth["credentials"]["token"])
  end
end
