json.array! @event.get_event_stats do |standing|
  json.merge!       standing
  json.ifpa_stats   Player.where(matchplay_player_id: standing["player_id"]).first&.ifpa_stats
end