require 'rails_helper'

describe "As a logged in User" do
  it "When I hit submit I am rerouted to my profile page where I see that info" do

    user = create(:user)
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit profile_path

    expect(page).to have_button("Update Profile")

    click_button "Update Profile"

    expect(current_path).to eq(edit_user_path(user))

    fill_in "user[address]", with: "123 New St"
    fill_in "user[zip]", with: 80021

    click_button "Submit Profile Info"

    expect(current_path).to eq(profile_path)
    expect(page).to have_content("123 New St")
    expect(page).to have_content(80021)

  end
end
