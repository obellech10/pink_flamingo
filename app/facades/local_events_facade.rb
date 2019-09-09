class LocalEventsFacade
  def local_events(user_ad, event_ad)
    grab_local_events(user_ad, event_ad)
  end

  private
    def grab_local_events(user_ad, event_ad)
      DistanceMatrixAPI.new(user_ad, event_ad).retrieve_distance
    end
end
