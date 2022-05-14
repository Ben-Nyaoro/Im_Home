class CreateSafePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :safe_places do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
