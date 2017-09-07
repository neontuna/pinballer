class MatchplayEventsController < ApplicationController
  def show
    @event = MatchplayEvent.find_or_create_by(matchplay_id: params[:id])
    @players = ActiveRecord::Associations::Preloader.new.preload(@event, :players)
    AssociateNewPlayersJob.perform_async(@event.id)
  end
end
