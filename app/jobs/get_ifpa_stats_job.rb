class GetIfpaStatsJob < ApplicationJob
  queue_as :default

  def perform(player)
    sleep(2)
    player.save_ifpa_stats
  end
end
