class CreatePlayerEventJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_join_table :players, :matchplay_events do |t|
      # t.index [:player_id, :matchplay_event_id]
      t.index [:matchplay_event_id, :player_id], name: "matchplay_players_index"
    end
  end
end
