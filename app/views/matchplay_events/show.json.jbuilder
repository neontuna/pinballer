json.array! @event.get_event_stats do |standing|
  player = Player.where(matchplay_player_id: standing["player_id"]).first

  json.merge!           standing
  json.ifpa_stats       player&.ifpa_stats
  json.ifpa_updated_at  player&.updated_at
end