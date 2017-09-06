class CreateMatchplayEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :matchplay_events do |t|
      t.string :matchplay_id

      t.timestamps
    end

    change_table :players do |t|
      t.rename :ifpa, :ifpa_stats
    end
  end
end
