require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:name)}
  end

	describe 'relationships' do
		it {should have_many :events}
		it {should have_many :event_attendees}
	end

  describe "#create_with_omniauth" do
    it "should return hash" do
      auth = {
    		:credentials => {:token => "1"},
    	 	 :provider => 'facebook',
    	 	 :uid => '1',
    		:extra => {:raw_info => {:name => "jori"}}
    		}

      User.create_with_omniauth(auth)
      
      expect(auth[:provider]).to eq("facebook")
    end
  end

  describe ".add_credential" do
  end
end
