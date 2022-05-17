class Address < ApplicationRecord
  has_many :safe_places
  validates :address_line1, :city, presence: true
end
