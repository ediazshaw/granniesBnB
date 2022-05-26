class Ability < ApplicationRecord
  has_many :granny_abilities
  has_many :grannies, through: :granny_abilities
end
