class Address < ApplicationRecord
  has_many :safe_places
	has_many :starting_point_journey, class_name: "Journey", foreign_key: "starting_point_id"
	has_many :destination_journey, class_name: "Journey", foreign_key: "destination_id"
  # validates :address_line1, :city, presence: true
	geocoded_by :address_line1
  after_validation :geocode, if: :will_save_change_to_address_line1?
end
