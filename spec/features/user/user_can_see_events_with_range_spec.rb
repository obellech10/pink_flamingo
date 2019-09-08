require 'rails_helper'

describe "As as a user on my events show page" do
  before :each do
    @deb = create(:user, name: "Debbie F. Downer", address: "5073 Valentia St, Denver, CO 80238")
    @patty = create(:user, name: "Patty McParty", address: "5083 Verbena St, Denver, CO 80238")
    @host1 = create(:user, name: "Hostess w Mostest", address: "8393 Beekman Pl, Denver, CO 80216")
    @host2 = create(:user, name: "Nice Guy", address: "5069 Valentia St, Denver, CO 80216")
    @funevent = create(:event, title: "Deb's not invited", user: @host, radius: 100, restrictions: "Deb")
    @dumbevent = create(:event, title: "Cheese and Crackers", user: @host, radius: 100, restrictions: "Fun")
  end

  it "I should only see events near me" do
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@deb)

    visit profile_path

    click_on "Events in Your Neighborhood"

    expect(page).to have_content(@dumbevent.title)

    expect(page).to_not have_content(@funevent.title)
  end
end
