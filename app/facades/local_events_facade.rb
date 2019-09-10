class LocalEventsFacade
  def user_within_event_radius(user_ad, event_ad, event_radius)
    grab_local_events(user_ad, event_ad) <= event_radius
  end

  private
    def grab_local_events(user_ad, event_ad)
      DistanceMatrixAPI.new(user_ad, event_ad).retrieve_distance
    end
end
