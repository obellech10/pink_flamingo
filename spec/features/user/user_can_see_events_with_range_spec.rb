require 'rails_helper'

describe "As as a user on my events show page" do
  before :each do
    @patty = create(:user, name: "Patty McParty", address: "5083 Verbena St, Denver, CO 80238")
    @host1 = create(:user, name: "Hostess w Mostest", address: "8393 Beekman Pl, Denver, CO 80216")
    @funevent = create(:event, title: "Deb's not invited", user: @host1, radius: 0.25, restrictions: "Deb", address: "8393 Beekman Pl, Denver, CO 80216")

    @deb = create(:user, name: "Debbie F. Downer", address: "5084 Trenton St, Denver, CO 80238")
    @host2 = create(:user, name: "Nice Guy", address: "5076 Trenton St, Denver, CO 80238")
    @dumbevent = create(:event, title: "Cheese and Crackers", user: @host2, radius: 200.0, restrictions: "Fun", address: "5076 Trenton St, Denver, CO 80238")
  end

  it "I should only see events near me" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@deb)

    visit profile_path

    click_on "Events in Your Neighborhood"

    expect(page).to have_content(@dumbevent.title)

    expect(page).to_not have_content(@funevent.title)
  end
end
