require 'rails_helper'

describe "As a user on the Events Index page" do
  describe "I select an event, am rerouted to that event show page" do
    it "I see the details of that event, the option to RSVP, and a map" do
      stub_omniauth

      user = User.create!(name: 'Jules Doe', address: "123 Main St", city: "Denver", state: "CO", zip: 80203, email: "joe@example.com")
      event = user.events.create!(title: "Football Watch Party", date: "9-13-19", time: "8:00pm", address: "123 Main St", food: true, booze: true, radius: 2.0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit events_path

      expect(page).to have_content("Football Watch Party")

      click_on "Football Watch Party"

      expect(current_path).to eq(event_path(event))

      expect(page).to have_content("Football Watch Party")

      expect(page).to have_button("RSVP")

      expect(page).to have_css('.location_map')
    end
  end
end
