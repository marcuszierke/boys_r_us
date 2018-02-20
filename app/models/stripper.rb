class Stripper < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :bookings
  has_many :users, through: :bookings

  # validates :name, :city, :description, :hair_color, :eye_color, presence: true
  # validates :height, :price, :review, numericality: true, presence: true
  # validates :solo, :availability, presence: true
end
