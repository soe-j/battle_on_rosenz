class CreateTerritories < ActiveRecord::Migration[5.0]
  def change
    create_table :territories do |t|
      t.integer :station_code
      t.string :color

      t.timestamps
    end
  end
end
