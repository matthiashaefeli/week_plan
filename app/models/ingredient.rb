class Ingredient < ApplicationRecord
  belongs_to :my_meal
  belongs_to :food
  belongs_to :measure
end
