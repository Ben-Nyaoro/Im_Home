class AddProfilePictureToBuddy < ActiveRecord::Migration[6.1]
  def change
    add_column :buddies, :profile_picture, :string
  end
end
