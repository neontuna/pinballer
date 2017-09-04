class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.jsonb :ifpa

      t.timestamps
    end
  end
end
