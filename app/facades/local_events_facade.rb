class LocalEventsFacade
  def initialize(user_ad, event_ad)
    @user_ad  = user_ad
    @event_ad = event_ad
  end

  def local_events
    grab_local_events
  end

  private
    def grab_local_events
      DistanceMatrixAPI.new(user_ad, event_ad).retrieve_distance
    end

    attr_reader :user_ad,
                :event_ad
end
