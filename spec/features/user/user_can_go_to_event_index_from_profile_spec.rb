require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I visit my profile page' do
    it "I can click on events in your neighborhood and I'm taken to event index page" do
      user = create(:user, name: 'Jon Doe', address: "123 Main St", city: "Denver", state: "CO", zip: 80203, email: "joe@example.com")

      event_1 = create(:event, user: user, title: "Football Watch Party", date: "9-13-19", time: "8:00pm", address: "123 Main St", food: true, booze: true, radius: 0.25)
      event_2 = create(:event, user: user, title: "Book Club", date: "10-13-19", time: "8:00pm", address: "123 Main St", food: false, booze: false, radius: 1.0)
      event_3 = create(:event, user: user, title: "Poker Night", date: "11-13-19", time: "8:00pm", address: "123 Main St", food: false, booze: true, radius: 1.0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit "/profile"

      expect(current_path).to eq(profile_path)

      expect(page).to have_content("Events in Your Neighborhood")
      click_link 'Events in Your Neighborhood'

      expect(page).to have_content("Nearby Events")

      within ".event-#{event_2.id}" do
        expect(page).to have_content(event_2.title)
        expect(page).to have_link(event_2.title)
        expect(page).to have_content("10-13-19")
      end
    end
  end
end
