require 'rails_helper'

describe "As a user on my profile page" do
  describe "I see a button to create an event" do
    before :each do
      @title = "ROCKING PARTY BRO"
      @date = "08/30/2019"
      @time = "7 - 10 pm"
      @address = "3959 Road Place"
      @user = create(:user)
      @id = @user.id
      @event_type = "Pool Party"
      @food = true
      @booze = true
      @restrictions = "Kids"
    end

    it "I see spaces for the date, time, location, radius, type of event, food, alcohol, and restrictions" do
      mock_omniauth

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
      fill_in "event[food]", with: @food
      fill_in "event[booze]", with: @booze
      fill_in "event[restrictions]", with: @restrictions

      click_on "Create"

      event = Event.last

      expect(current_path).to eq(event_path(event.id))

      expect(page).to have_content(@title)
      expect(page).to have_content(@date)
      expect(page).to have_content(@time)
      expect(page).to have_content(@address)






    end
  end
end
