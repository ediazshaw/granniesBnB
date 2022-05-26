class Booking < ApplicationRecord
  belongs_to :granny
  belongs_to :user
end
