require 'rails_helper'

describe "User can rsvp" do
    it "when they visit an event show page and they are not the host" do

      user = User.create!(name: 'Jules Doe', address: "123 Main St", city: "Denver", state: "CO", zip: 80203, email: "joe@example.com")
      user_1 = User.create!(name: 'Jules Doe', address: "124 Main St", city: "Denver", state: "CO", zip: 80203, email: "joe@example.com")
      event = user.events.create!(title: "Football Watch Party", date: "9-13-19", time: "8:00pm", address: "123 Main St", food: true, booze: true, radius: 2.0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

      visit event_path(event)

      within ".rsvp" do
        select "I'll be there"
        fill_in "Number of guests", with: 2
        click_on "RSVP"
      end

      expect(current_path).to eq(event_path(event))
    end
  end
