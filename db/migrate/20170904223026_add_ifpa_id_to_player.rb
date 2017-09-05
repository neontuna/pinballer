class AddIfpaIdToPlayer < ActiveRecord::Migration[5.1]
  def change
    add_column :players, :ifpa_id, :string
  end
end
