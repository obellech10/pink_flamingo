require 'rails_helper'

RSpec.describe DistanceMatrixAPI, type: :service do
  before(:each) do
    @user_ad  = "16199 Green Valley Ranch Blvd"
    @event_ad = "312 Idalea St."
    @service = DistanceMatrixAPI.new(@user_ad, @event_ad)
  end

  it "exists" do
    expect(@service).to be_a(DistanceMatrixAPI)
  end

  it "Finds distance" do
    expect(@service.retrieve_distance).to be_kind_of(Float)
  end

end
