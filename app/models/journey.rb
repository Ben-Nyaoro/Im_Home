class Journey < ApplicationRecord
  belongs_to :user
  belongs_to :buddy
  enum journey_status: %i[started ongoing completed]
  enum buddy_status: %i[accepted declined]
  validates :starting_point, :destination, :mode_of_transport, presence: true
  validates :time_estimate, presence: true, inclution: { in: %i[10 20 30 40 50 60] }
end
