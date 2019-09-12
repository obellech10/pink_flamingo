require 'rails_helper'

RSpec.describe EventAttendee, type: :model do
	describe 'relationships' do
		it {should belong_to :event}
		it {should belong_to :user}
	end

	describe "#attendees" do
		it "returns the correct attendees" do
			host1 = create(:user)
			host2 = create(:user)

			event1 = create(:event, user: host1)
			event2 = create(:event, user: host2)

			user1 = create(:user, name: "Sarah")
			user2 = create(:user, name: "Jessica")
			user3 = create(:user, name: "Whitney")
			user4 = create(:user, name: "Jeff")
			user5 = create(:user, name: "Nathan")
			user6 = create(:user, name: "Jake")
			user7 = create(:user, name: "Violet")
			user8 = create(:user, name: "Coy")
			user9 = create(:user, name: "Saige")
			user10 = create(:user, name: "Lisa")

			ea1 = user1.event_attendees.create(number_of_guests: 5, event: event1, rsvp: 2 )
			ea2 = user2.event_attendees.create(number_of_guests: 5, event: event1, rsvp: 2)
			ea3 = user3.event_attendees.create(number_of_guests: 5, event: event1, rsvp: 2)
			ea4 = user4.event_attendees.create(number_of_guests: 0, event: event1, rsvp: 1)
			ea5 = user5.event_attendees.create(number_of_guests: 5, event: event1, rsvp: 2)
			ea6 = user6.event_attendees.create(number_of_guests: 0, event: event1, rsvp: 0)
			ea7 = user7.event_attendees.create(number_of_guests: 0, event: event1, rsvp: 0)
			ea8 = user8.event_attendees.create(number_of_guests: 0, event: event1, rsvp: 1)
			ea9 = user9.event_attendees.create(number_of_guests: 3, event: event2, rsvp: 2)
			ea10 = user10.event_attendees.create(number_of_guests: 3, event: event2, rsvp: 2)

	
			not_coming = [user9, user10]
			people = EventAttendee.attendees(event1)

			expect(people).to_not eq(not_coming)
		end
	end
end
