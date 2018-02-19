class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :stripper
  validates :starts_at, numericality: true, presence: true
  validates :ends_at, numericality: true, presence: true
end
