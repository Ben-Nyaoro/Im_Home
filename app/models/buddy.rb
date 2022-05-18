class Buddy < ApplicationRecord
  belongs_to :user
  has_many :journeys
  validates :name, :phone_number, presence: true
  has_one_attached :profile_picture
end
