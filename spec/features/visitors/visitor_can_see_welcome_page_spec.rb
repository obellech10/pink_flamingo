require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I can visit the welcome page' do
    visit '/'

    expect(current_path).to eq(root_path)

    expect(page).to have_link("What is it?")
    expect(page).to have_content("An app to bring you closer to your community")
    expect(page).to have_button("Login")
  end
end
