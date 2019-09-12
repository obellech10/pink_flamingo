require 'rails_helper'

RSpec.describe Credential, type: :model do
  describe 'validations' do
    it {should validate_presence_of(:uid)}
    it {should validate_presence_of(:token)}
    it {should validate_presence_of(:provider)}
  end

	describe 'relationships' do
		it {should belong_to :user}
	end

  describe "creates user with omniauth" do
    it "find_or_create_by_omniauth" do
      
    end
  end
end
