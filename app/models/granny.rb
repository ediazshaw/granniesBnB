class Granny < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_interger: true }
  validates :city, presence: true
  has_one_attached :photo

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
