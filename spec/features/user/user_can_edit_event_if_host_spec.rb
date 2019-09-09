require 'rails_helper'

describe "User can edit event" do
  it "only if they are a host" do
    user = create(:user)
    event = create(:event, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit event_path(event)

    click_on "Edit Event"

    expect(current_path).to eq(edit_event_path(event))

    fill_in "event[date]", with: "Sept 22nd"
    fill_in "event[time]", with: "7pm"

    click_on "Update Event"

    expect(current_path).to eq(event_path(event))
    expect(page).to have_content "Sept 22nd"
    expect(page).to have_content "7pm"
  end

  it "I cannot edit an event if I am not the host" do
    user = create(:user)
    user_1 = create(:user)
    event = create(:event, user_id: user.id)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user_1)

    visit event_path(event)

    expect(current_path).to eq(event_path(event))
    expect(page).to_not have_button("Edit Event")

    page.driver.submit :patch, event_path(event), {}
    expect(page).to have_content("The page you were looking for doesn't exist")
  end
end
