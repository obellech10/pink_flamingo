require 'rails_helper'

describe "As a user on my profile page" do
  describe "I see a button to create an event" do
    before :each do
      @title = "ROCKING PARTY BRO"
      @date = "08/30/2019"
      @time = "7 - 10 pm"
      @address = "3959 Road Place"
      @user = User.create!(name: 'Jon Doe', address: "123 Main St", city: "Denver", state: "CO", zip: 80203, email: "joe@example.com")
      @id = @user.id
      @event_type = "Pool Party"
      @food = true
      @booze = true
      @restrictions = "Kids"
      @radius = 1000.0
    end

    it "I see spaces for the date, time, location, radius, type of event, food, alcohol, and restrictions" do
      stub_omniauth

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit profile_path

      expect(page).to have_button("Create an Event")

      click_on "Create an Event"

      expect(current_path).to eq(new_event_path)

      fill_in "event[title]", with: @title
      fill_in "event[date]", with: @date
      fill_in "event[time]", with: @time
      fill_in "event[address]", with: @address
      fill_in "event[event_type]", with: @event_type
      check "event[food]"
      check "event[booze]"
      fill_in "event[restrictions]", with: @restrictions
      fill_in "event[radius]", with: @radius

      click_on "Create"

      event = Event.last
      event_id = event.id

      expect(current_path).to eq(event_path(event_id))

      expect(page).to have_content(@title)
      expect(page).to have_content(@date)
      expect(page).to have_content(@time)
      expect(page).to have_content(@address)

      OmniAuth.config.mock_auth[:google] = nil
    end

    it "All areas of form must be filled in" do
      stub_omniauth

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

      visit profile_path

      expect(page).to have_button("Create an Event")

      click_on "Create an Event"

      expect(current_path).to eq(new_event_path)

      fill_in "event[title]", with: @title
      fill_in "event[date]", with: @date
      fill_in "event[time]", with: @time

      click_on "Create"

      expect(current_path).to eq(new_event_path)
      expect(page).to have_content("There was an error: please try again.")
    end
  end
end
