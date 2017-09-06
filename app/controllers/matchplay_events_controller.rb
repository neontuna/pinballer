class MatchplayEventsController < ApplicationController
  def show
    @event = MatchplayEvent.find_or_create_by(matchplay_id: params[:id])
    @event.associate_players
  end
end
