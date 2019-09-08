require 'rails_helper'

RSpec.describe 'As a user' do
  describe 'When I visit the event index' do
    it "and click on an event I'm taken to it's show page" do
      user = User.create!(name: 'Jules Doe', address: "123 Main St", city: "Denver", state: "CO", zip: 80203, email: "joe@example.com")

      event_1 = user.events.create!(title: "Football Watch Party", date: "9-13-19", time: "8:00pm", address: "123 Main St", food: true, booze: true)
      event_2 = user.events.create!(title: "Book Club", date: "10-13-19", time: "8:00pm", address: "123 Main St", food: false, booze: false)
      event_3 = user.events.create!(title: "Poker Night", date: "11-13-19", time: "8:00pm", address: "123 Main St", food: false, booze: true)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit '/events'

      within ".event-#{event_2.id}" do
        expect(page).to have_content("Book Club")
        expect(page).to have_link(event_2.title)
        expect(page).to have_content("10-13-19")
        click_link 'Book Club'
      end

      expect(current_path).to eq(event_path(event_2.id))

      expect(page).to have_content("Book Club")
    end

    it "I cannot access events if I do not have an address" do
      user = User.create!(name: "Jori")
      create(:event, user: user)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      page.driver.submit :get, event_path(Event.all[0].id), {}
      expect(page).to have_content("The page you were looking for doesn't exist")

      page.driver.submit :get, events_path, {}
      expect(page).to have_content("The page you were looking for doesn't exist")

      page.driver.submit :post, events_path, {}
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
