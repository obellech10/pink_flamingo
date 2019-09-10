class TwilioFacade

  def sendtext(value, number)
    if value == 0
      #host created event
      message = "~PinkFlamingo~ You've successfully created an event! :D"
    elsif value == 1
      #Rsvp for event
      message = "~PinkFlamingo~ You've successfully RSVP'd! :D"
    elsif value == 2
      #Event Cancelled
      message = "~PinkFlamingo~ An event you've planned on going to has been cancelled! :("
    elsif value == 3
      #24 hour heads up
      message = "~PinkFlamingo~ You have an event tomorrow! :D"
    end
    conn = Faraday.new(url: "http://localhost:4567") do |f|
    f.params["send"] = 'true'
    f.params["to"] = '+1' + number
    f.params["body"] = message
    f.adapter  Faraday.default_adapter
    end
  conn.get("/texter")
  end

end
