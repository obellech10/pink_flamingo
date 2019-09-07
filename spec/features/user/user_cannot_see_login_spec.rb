require 'rails_helper'

describe 'No Login Options' do

  it 'user cannot see login buttons on root page' do
		user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit root_path

		expect(page).to_not have_button("Connect via Facebook")
		expect(page).to_not have_button("Connect via Google")
	end
end
