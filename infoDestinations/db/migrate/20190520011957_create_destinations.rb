class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :id_destination
      t.string :name
      t.string :weather
      t.string :description
      t.string :time_zone
      t.datetime :landing_time
      t.datetime :boarding_time

      t.timestamps
    end
  end
end
