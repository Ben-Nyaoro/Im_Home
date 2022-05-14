class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :address_line1
      t.string :address_line2
      t.integer :postcode
      t.string :city

      t.timestamps
    end
  end
end
