require 'rails_helper'

describe "As a user on the Events Index page" do
  describe "I select an event, am rerouted to that event show page" do
    it "I see the details of that event, the option to RSVP, and a map" do
      stub_omniauth

      user = create(:user)
      event = create(:event, user_id: user.id, address: "2795 Speer Blvd")

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit events_path

      expect(page).to have_content("Its my Partaaaaay!")

      click_on "Its my Partaaaaay!"

      expect(current_path).to eq(event_path(event))

      expect(page).to have_content("Its my Partaaaaay!")

      expect(page).to have_button("RSVP")

      expect(page).to have_css('iframe#location_map')
    end
  end
end
