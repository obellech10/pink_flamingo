require 'rails_helper'

RSpec.describe DistanceMatrixAPI, type: :service do
  it 'exist' do
    expect(service).to be_a DistanceMatrixAPI
    binding.pry
  end

end
