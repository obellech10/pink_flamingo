require 'rails_helper'

describe "As a logged in User on my profile page" do
  describe "I can see fields to fill in my personal info" do
    before :each do
      @address = "8429 Circle Drive"
      @city = "Brooklyn"
      @state = "NY"
      @zip = "10010"
      @phone = "504-863-7468"
      @email = "hotstuff@hotmail.com"
    end

    it "When I hit submit I am rerouted to my profile page where I see that info" do
      user = User.create(name: "Jori")
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit profile_path

      expect(page).to have_button("Complete your profile")
      expect(page).to_not have_link("Events In Your Neighborhood")

      click_button "Complete your profile"

      expect(current_path).to eq(edit_user_path(user))

      fill_in "user[address]", with: @address
      fill_in "user[city]", with: @city
      fill_in "user[state]", with: @state
      fill_in "user[zip]", with: @zip
      fill_in "user[phone]", with: @phone
      fill_in "user[email]", with: @email

      click_button "Submit Profile Info"

      expect(current_path).to eq(profile_path)

      within(page.first("#user-info")) do
        expect(page).to have_css(".masthead-subheading")
      end

      expect(page.all(".user-address").first).to have_content(@address)
      expect(page.all(".user-state-zip").first).to have_content(@city)
      expect(page.all(".user-state-zip").first).to have_content(@state)
      expect(page.all(".user-phone").first).to have_content(@phone_number)
      expect(page.all(".user-email").first).to have_content(@email)

      expect(page).to have_button("Create an Event")

      OmniAuth.config.mock_auth[:google] = nil
    end
  end
end
