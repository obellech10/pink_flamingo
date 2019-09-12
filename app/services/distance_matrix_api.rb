class DistanceMatrixAPI
  def initialize(user_ad, event_ad)
    @user_ad  = user_ad
    @event_ad = event_ad
  end

    def retrieve_distance
      parse_response.delete(" mi").to_f
    end

private
    attr_reader :user_ad,
                :event_ad
                
    def connection
        Faraday.new(:url => 'https://maps.googleapis.com') do |f|
        f.request  :url_encoded
        f.response :logger
        f.adapter  Faraday.default_adapter
      end
    end

    def get_response
      connection.get do |req|
        req.url '/maps/api/distancematrix/json?'
        req.params['key'] = ENV['GOOGLE_API_KEY']
        req.params['origins'] = user_ad
        req.params['destinations'] = event_ad
        req.params['units'] = 'imperial'
      end
    end

    def parse_response
      JSON.parse(get_response.body, symbolize_names: true)[:rows].first[:elements].first[:distance][:text]
    end
end
