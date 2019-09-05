require 'rails_helper'

RSpec.describe EventAttendee, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:rsvp)}
  end

	describe 'relationships' do
		it {should belong_to :event}
		it {should belong_to :user}
	end
end
