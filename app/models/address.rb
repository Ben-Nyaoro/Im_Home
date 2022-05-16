class Address < ApplicationRecord
  has_many :safe_places
  validates :address_line1, :address_line2, :city, presence: true
end
