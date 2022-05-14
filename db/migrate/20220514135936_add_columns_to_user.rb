class AddColumnsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :profile_picture, :string
    add_column :users, :phone_number, :string
  end
end
