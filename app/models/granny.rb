class Granny < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_interger: true }
  has_one_attached :photo

  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
