class Granny < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :granny_abilities, dependent: :destroy
  has_many :abilities, through: :granny_abilities
  has_one_attached :photo
  validates :photo, presence: true

  validates :name, presence: { message: "Cannot be blank" }
  validates :age, presence: { message: "Cannot be blank" }, numericality: { only_integer: true }
  validates :description, length: { maximum: 1000, too_long: `%{count} characters is the maximum allowed` }

  validates :city, presence: { message: "Cannot be blank" }
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  pg_search_scope :city_search,
  against: [ :city ],
  using: {
    tsearch: { prefix: true }
  }
end
