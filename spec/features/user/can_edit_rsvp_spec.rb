require 'rails_helper'

describe "As a user who has RSVP'd to an event" do
  before :each do
    @patty = create(:user, name: "Patty McParty", address: "8071 E 54th Dr, Denver, CO 80238")
    @host1 = create(:user, name: "Hostess w Mostest", address: "8031 E 54th Dr, Denver, CO 80238")
    @firstevent = create(:event, title: "Pool Party", user: @host1, radius: 100.0, address: "8031 E 54th Dr, Denver, CO 80238")
  end

  it "I can edit that RSVP" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@patty)

    visit event_path(@firstevent)
    within ".rsvp" do
      select "I'll be there"
      fill_in "Number of guests", with: 2
      click_on "RSVP"
    end
    expect(current_path).to eq(event_path(@firstevent))

    save_and_open_page
    expect(page).to have_content("Edit RSVP")
  end
end
