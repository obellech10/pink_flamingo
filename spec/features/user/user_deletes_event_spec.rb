require 'rails_helper'

describe "As the host of an event" do
  before :each do
    @patty = create(:user, name: "Patty McParty", address: "5083 Verbena St, Denver, CO 80238")
    @host1 = create(:user, name: "Hostess w Mostest", address: "8393 Beekman Pl, Denver, CO 80216")
    @firstevent = create(:event, title: "Pool Party", user: @host1, radius: 1.0, address: "8393 Beekman Pl, Denver, CO 80216")
    @secondevent = create(:event, title: "Grilling Party", user: @host1, radius: 1.0, address: "8393 Beekman Pl, Denver, CO 80216")
  end

  describe "I can delete that event and it is no longer visible" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@host1)

    visit events_path

    expect(page).to have_content("Pool Party")
    expect(page).to have_content("Grilling Party")

    within(first('.party-list')) do
      expect(page).to have_button("Delete Event")
    end

    click_button "Delete Event"

    expect(page).to have_content("Are you sure you want to delete this event?")

    click_button "Yes"

    expect(current_path).to eq(events_path)

    expect(page).to have_content("Grilling Party")
    expect(page).to_not have_content("Pool Party")
  end
end