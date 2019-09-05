require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I visit my profile page' do
    it "I can click on events in your neighborhood and I'm taken to event index page" do
      user = User.create!(first_name: 'Jon', last_name: 'Doe', address: "123 Main St", city: "Denver", state: "CO", zip: 80203, email: "joe@example.com")

      event_1 = user.events.create!(date: "9-13-19", time: "8:00pm", address: "123 Main St", restrictions: "Football Watch Party", food: true, booze: true)
      event_2 = user.events.create!(date: "10-13-19", time: "8:00pm", address: "123 Main St", restrictions: "Book Club", food: false, booze: false)
      event_3 = user.events.create!(date: "11-13-19", time: "8:00pm", address: "123 Main St", restrictions: "Poker Night", food: false, booze: true)

      visit "/profile/#{user.id}"

      expect(current_path).to eq(profile_path(user.id))

      expect(page).to have_content("Events in Your Neighborhood")
      click_link 'Events in Your Neighborhood'

      expect(page).to have_content("Nearby Events")

      within ".event-#{event_2.id}" do
        expect(page).to have_content("Book Club")
        expect(page).to have_link(event_2.restrictions)
        expect(page).to have_content("10-13-19")
      end
    end
  end
end
