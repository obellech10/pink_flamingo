require 'rails_helper'

RSpec.describe 'As a visitor' do
  it 'I can visit the welcome page' do
    visit '/'

    expect(current_path).to eq(root_path)

    expect(page).to have_link("What is it?")
    expect(page).to have_content("An app to bring you closer to your community")

  end

  it 'and view my login options' do
    visit '/'

    expect(page).to have_button('Connect via Google')
    expect(page).to have_button('Connect via Facebook')
  end
end
