class Journey < ApplicationRecord
  belongs_to :user
  belongs_to :buddy
  enum journey_status: %i[inactive started completed], _default: "inactive"
  enum buddy_status: %i[unknown accepted declined], _default: "unknown"
  validates :starting_point, :destination, :mode_of_transport, presence: true
  validates :time_estimate, presence: true, inclusion: { in: %i[10 20 30 40 50 60] }
end
