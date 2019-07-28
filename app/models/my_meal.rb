class MyMeal < ApplicationRecord
  has_one_attached :avatar
  validates :strMeal, :strCategory, :strArea, :strInstructions, presence: true

  def to_hash
    hash = {}
    self.attributes.each { |k,v| hash[k] = v }
    hash
  end

  def self.my_meal_array(cat)
    my_meals_array = []
    my_meals = MyMeal.where(strCategory: cat)
    my_meals.each do |m|
      my_meals_array << m.to_hash.select {|k,v| !k.include?('strIngredient') && !k.include?('strMeasure') }
    end
    my_meals_array
  end
end
