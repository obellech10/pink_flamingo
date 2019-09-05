require 'rails_helper'

describe 'User login' do
		stub_omniauth

    visit '/'
    click_on "Login"

    expect(current_path).to eq(login_path)

    # fill_in 'session[email]', with: @user.email
    # fill_in 'session[password]', with: @user.password
    click_on 'Log In'

		click_on "Connect via Facebook"

    expect(current_path).to eq(profile_path)
		expect(page).to_not have_content("Connect via Facebook")
    # expect(page).to have_content("Profile")
  end
