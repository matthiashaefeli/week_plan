class Ingredient < ApplicationRecord
  has_and_belongs_to_many :my_meals
  has_and_belongs_to_many :foods
  has_and_belongs_to_many :measures
end
