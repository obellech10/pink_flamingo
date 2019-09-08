class DistanceMatrixAPI
  conn = Faraday.new(:url => 'http://maps.googleapis.com') do |f|
    f.request  :url_encoded
    f.response :logger
    f.adapter  Faraday.default_adapter
  end

  response = conn.get do |req|
    req.url '/maps/api/distancematrix/json?'
    req.params['key'] = ENV['GOOGLE_API_KEY']

  end

  response.body

end
