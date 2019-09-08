class EventLocationFacade
  attr_reader :address

  def initialize(address)
    @address = address
  end

  def key_location
    "#{ENV['GOOGLE_API_KEY']}&q=#{address}"
  end
end
