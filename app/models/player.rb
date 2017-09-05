require "httparty"

class Player < ApplicationRecord

  def save_ifpa_stats
    update!(ifpa: get_ifpa_stats(ifpa_id))
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
