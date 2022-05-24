class Journey < ApplicationRecord
  belongs_to :user
  belongs_to :buddy

  belongs_to :starting_point, class_name: "Address"
  belongs_to :destination, class_name: "Address"
  enum journey_status: %i[inactive started completed], _default: "inactive"
  enum buddy_status: %i[unknown accepted declined], _default: "unknown"
  validates :time_estimate, presence: true, inclusion: { in: [10, 20, 30, 40, 50, 60] }
  validates :mode_of_transportation, presence: true, inclusion: { in: ["Bus", "Train", "Taxi/Uber", "Car", "Foot"] }

  accepts_nested_attributes_for :starting_point
  accepts_nested_attributes_for :destination
end
