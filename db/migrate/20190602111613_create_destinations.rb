class CreateDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :destinations do |t|
      t.string :name
      t.string :weather
      t.text :description
      t.string :timezone
      t.datetime :landingtime
      t.datetime :boardingtime

      t.timestamps
    end
  end
end
