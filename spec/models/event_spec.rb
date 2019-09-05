require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:time)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:user_id)}
    # it {should validate_presence_of(:type)}
  end

	describe 'relationships' do
		it {should belong_to :user}
		it {should have_many :event_attendees}
	end
end
