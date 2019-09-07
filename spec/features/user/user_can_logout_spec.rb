require 'rails_helper'

describe 'User can log out' do

  it 'user can log out of session' do
		user = create(:user)

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

    visit profile_path

    click_link "Logout"

    expect(current_path).to eq(root_path)
  end
end
