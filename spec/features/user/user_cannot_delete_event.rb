require 'rails_helper'

describe "as a regular user on an event index page" do
  it "because I did not create the event, I cannot delete it" do
    patty = create(:user, name: "Patty McParty", address: "8071 E 54th Dr, Denver, CO 80238")
    host1 = create(:user, name: "Hostess w Mostest", address: "8031 E 54th Dr, Denver, CO 80238")
    firstevent = create(:event, title: "Pool Party", user: host1, radius: 100.0, address: "8031 E 54th Dr, Denver, CO 80238")
    secondevent = create(:event, title: "Grilling Party", user: host1, radius: 100.0, address: "8031 E 54th Dr, Denver, CO 80238")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(patty)
    visit events_path

    expect(page).to have_content(firstevent.title)
    expect(page).to have_content(secondevent.title)

    expect(page).to_not have_button("Delete Event")
  end
end
