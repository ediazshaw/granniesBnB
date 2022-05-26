class Granny < ApplicationRecord
  include PgSearch::Model
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :granny_abilities, dependent: :destroy
  has_many :abilities, through: :granny_abilities

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_interger: true }
  has_one_attached :photo

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?

  pg_search_scope :city_search,
    against: [ :city ],
    using: {
      tsearch: { prefix: true }
    }
end
