class GetIfpaStatsJob < ApplicationJob
  include SuckerPunch::Job
  workers 1

  def perform(player_id)
    sleep(2)
    ActiveRecord::Base.connection_pool.with_connection do
      player = Player.find(player_id)
      player.save_ifpa_stats
    end
  end
end
