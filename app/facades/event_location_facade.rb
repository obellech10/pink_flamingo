class EventLocationFacade
  attr_reader :address

  def initialize(address)
    @address = address
  end

  def location_map
    conn = Faraday.new(:url => 'https://www.google.com') do |faraday|
      faraday.adapter  Faraday.default_adapter
    end

    conn.get do |req|
      req.url '/maps/embed/v1/place?'
      req.params['key'] = ENV['GOOGLE_API_KEY']
      req.params['q'] = @address
    end
  end
end
