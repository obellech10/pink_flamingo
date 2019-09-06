require 'rails_helper'

describe 'As a visitor on the dashboard page' do
  xit "I see a button to login through google" do
    visit '/'

    expect(page).to have_button("Login with Google")

    click_button "Login with Google"

    expect(current_path).to eq(profile_path)

    OmniAuth.config.mock_auth[:google] = nil

    expect(page).to have_content("Welcome")
  end
end
