require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "I can see what the app is about by" do
    it "clicking on the what is it link" do
      visit '/'
      expect(current_path).to eq(root_path)

      click_on "What is it?"
      expect(current_path).to eq(about_path)

      expect(page).to have_content("So what is Pink Flamingo, you ask?")

      expect(page).to have_link('Home')
      click_on 'Home'
      expect(current_path).to eq(root_path)
    end
  end
end
