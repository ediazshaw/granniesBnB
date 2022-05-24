class Granny < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :age, presence: true, numericality: { only_interger: true }
end
