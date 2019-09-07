require 'rails_helper'

describe "As a user on the Events Index page" do
  describe "I select an event, am rerouted to that event show page" do
    before :each do
        @user = User.create!(name: 'Sandi Dunes', address: "9342 Main St", city: "New Orleans", state: "LA", zip: 80203, email: "Sandi@gmail.com")
        @event1 = @user.events.create(title: )

    end
    it "I see the details of that event, the option to RSVP, and a map" do
      mock_oauth

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)




    end
  end
end
