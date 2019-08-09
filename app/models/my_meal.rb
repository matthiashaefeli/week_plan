class MyMeal < ApplicationRecord
  has_one_attached :avatar, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_one :like, dependent: :destroy
  has_and_belongs_to_many :weeks
  has_many :likes
  validates :title, :category, :instructions, presence: true

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

  def self.my_meal_array_search(query)
    my_meal_array_search = []
    my_meals = MyMeal.where('"strMeal" LIKE ?', "%#{query}%")
    my_meals.each do |m|
      my_meal_array_search << m.to_hash.select {|k,v| !k.include?('strIngredient') && !k.include?('strMeasure') }
    end
    my_meal_array_search
  end
end
