class Ingredient < ApplicationRecord
  belongs_to :my_meal
  belongs_to :food
  belongs_to :measure
  validates :qty, numericality: { only_integer: true }
end
