require "httparty"

class Player < ApplicationRecord

  has_and_belongs_to_many :matchplay_events

  after_create :queue_stats

  def queue_stats
    GetIfpaStatsJob.perform_async(self.id)
  end

  def save_ifpa_stats
    stats = get_ifpa_stats(ifpa_id)
    update(ifpa_stats: stats) unless !stats
  end

  def get_ifpa_stats(id)
    response = HTTParty.get(
      "https://api.ifpapinball.com/v1/player/#{id}?api_key=#{ENV["ifpa_api_key"]}", 
      format: :json)

    if response.success?
      response.parsed_response.as_json
    else
      nil
    end
  end
end
