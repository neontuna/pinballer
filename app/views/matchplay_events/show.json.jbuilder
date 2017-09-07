json.array! @event.get_event_stats do |standing|
  player = @players[0].preloaded_records.find{|x| x.matchplay_player_id == standing["player_id"].to_s}

  json.merge!           standing
  json.ifpa_stats       player&.ifpa_stats
  json.ifpa_updated_at  player&.updated_at
end