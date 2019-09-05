require 'rails_helper'

RSpec.describe User, type: :model do
  # describe 'validations' do
  #   it {should validate_presence_of(:first_name)}
  #   it {should validate_presence_of(:last_name)}
  #   it {should validate_presence_of(:address)}
  #   it {should validate_presence_of(:city)}
  #   it {should validate_presence_of(:state)}
  #   it {should validate_presence_of(:zip)}
  #   it {should validate_presence_of(:email)}
  # end

	describe 'relationships' do
		it {should have_many :events}
		it {should have_many :event_attendees}
	end
end
