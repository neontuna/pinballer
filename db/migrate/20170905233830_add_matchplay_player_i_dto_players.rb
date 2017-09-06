class AddMatchplayPlayerIDtoPlayers < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :matchplay_player_id, :string
  end
end
