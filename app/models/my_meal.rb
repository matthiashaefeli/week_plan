class MyMeal < ApplicationRecord
  validates :strMeal, :strCategory, :strArea, :strInstructions, presence: true
end
