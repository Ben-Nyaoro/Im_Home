class CreateJourneys < ActiveRecord::Migration[6.1]
  def change
    create_table :journeys do |t|
      t.string :starting_point
      t.string :destination
      t.string :mode_of_transportation
      t.integer :time_estimate
      t.integer :journey_status
      t.integer :buddy_status
      t.references :user, null: false, foreign_key: true
      t.references :buddy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
