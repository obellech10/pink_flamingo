require 'rails_helper'

describe 'User login' do
	it 'can sign in using Facebook'do
		stub_omniauth

    visit '/'
    click_on "Login"

    expect(current_path).to eq(login_path)

		click_on "Connect via Facebook"

    expect(current_path).to eq(profile_path)
		expect(page).to_not have_content("Connect via Facebook")
  end
end
