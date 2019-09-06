require 'rails_helper'

describe "As a logged in User on my profile page" do
  describe "I can see fields to fill in my personal info" do
    it "When I hit submit I am rerouted to my profile page where I see that info" do
      visit root_path
      
      expect(page).to have_button("Login")

      click_button "Login"

      expect(page).to have_button("Connect via Facebook")

      click_button "Connect via Facebook"

      expect(current_path).to eq(profile_path)

      first_name = "Glinda"
      last_name = "LaRoux"
      address = "8429 Circle Drive"
      city = "Brooklyn"
      state = "NY"
      zip = "10010"
      phone = "504-863-7468"
      email = "hotstuff@hotmail.com"

      visit new_user_path

      fill_in 'user[first_name]', with: first_name
      fill_in 'user[last_name]', with: last_name
      fill_in 'user[address]', with: address
      fill_in 'user[city]', with: city
      fill_in 'user[state]', with: state
      fill_in 'user[zip]', with: zip
      fill_in 'user[phone]', with: phone
      fill_in 'user[email]', with: email

      click_button "Create Profile"

      expect(current_path).to eq(user_path(user.id))

      expect(page).to have_content("Welcome to your profile, #{first_name}!")
      expect(page).to have_content(first_name)
      expect(page).to have_content(last_name)
      expect(page).to have_content(address)
      expect(page).to have_content(city)
      expect(page).to have_content(state)
      expect(page).to have_content(phone_number)
      expect(page).to have_content(email)

      OmniAuth.config.mock_auth[:google] = nil
    end
  end
end
