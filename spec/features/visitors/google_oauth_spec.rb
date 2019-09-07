require 'rails_helper'

describe 'As a visitor on the dashboard page' do
  xit "I see a button to login through google" do
    stub_omniauth

    visit root_path

    expect(page).to have_button("Login")

    click_button "Login"

    expect(current_path).to eq(login_path)

    expect(page).to have_button("Connect via Google")

    click_on "Connect via Google"

    expect(current_path).to eq(profile_path)

    expect(page).to have_content("Successfully linked to that account!")

    OmniAuth.config.mock_auth[:google] = nil
  end
end
