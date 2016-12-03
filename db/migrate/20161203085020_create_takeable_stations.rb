class CreateTakeableStations < ActiveRecord::Migration[5.0]
  def change
    create_table :takeable_stations do |t|
      t.integer :code
      t.string :color

      t.timestamps
    end
  end
end
