require "httparty"

class MatchplayEvent < ApplicationRecord

  has_and_belongs_to_many :players

  # after_create :associate_new_players

  def get_event_stats
    response = HTTParty.get(
      "https://matchplay.events/api-beta/tournaments/#{self.matchplay_id}/standings", 
      format: :json)

    if response.success?
      response.parsed_response.as_json
    else
      {}
    end    
  end

  def get_event_players(id)
    response = HTTParty.get(
      "https://matchplay.events/api-beta/tournaments/#{id}", 
      format: :json)

    if response.success?
      response.parsed_response.as_json
    else
      []
    end
  end

  def associate_new_players
    players_list = get_event_players(matchplay_id)["players"]
    existing_players = self.players.pluck(:ifpa_id)

    # create array with matchplay and ifpa IDs, delete any that are already
    # associated
    ifpa_ids = players_list.map do |p|
      next if existing_players.include?(p["ifpa_id"].to_s) || 
        p["ifpa_id"] == nil

      {"ifpa_id": p["ifpa_id"], "matchplay_player_id": p["player_id"]}
    end.compact

    # find or create Player records based of ifpa ID
    ifpa_ids.each do |id|
      Player.find_or_create_by(ifpa_id: id[:ifpa_id]) do |player|
        player.matchplay_player_id = id[:matchplay_player_id]
      end
    end

    # finally, associate players
    self.players << Player.where(ifpa_id: ifpa_ids.pluck(:ifpa_id))
  end

end
