class AssociateNewPlayersJob < ApplicationJob
  include SuckerPunch::Job

  def perform(matchplay_id)
    ActiveRecord::Base.connection_pool.with_connection do
      MatchplayEvent.find(matchplay_id).associate_new_players
    end    
  end
end
