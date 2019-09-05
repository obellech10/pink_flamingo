require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'I can view the login page' do
    it 'and view my login options' do
      visit '/'

      click_on 'Login'
      expect(current_path).to eq(login_path)

      expect(page).to have_button('Connect via Google')
      expect(page).to have_button('Connect via Facebook')
    end
  end
end
