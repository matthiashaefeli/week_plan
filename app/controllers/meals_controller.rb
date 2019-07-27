require 'net/http'
class MealsController < ApplicationController
  before_action :loged_in
  def index
    begin
      url = ENV['all_categories_url']
      result = Net::HTTP.get(URI.parse(url))
      categories = JSON.parse(result)
      @categories = categories['categories']
    rescue
      @error = 'Sorry: Meal Server Down. Please Come Back Later!'
    end
  end

  def meals
    @likes = current_user.likes.map { |l| l.meal_string }
    begin
      url = ENV['category_url'] + params[:category]
      result = Net::HTTP.get(URI.parse(url))
      meals = JSON.parse(result)
      my_meal_array = MyMeal.my_meal_array
      @meals = meals['meals'] + my_meal_array
    rescue
      @error = 'Sorry: Meal Server Down. Please Come Back Later!'
    end
     render partial: 'meals'
  end

  def recipes
    if params[:local]
      meal = MyMeal.find(params[:id])
      @recipe = meal.to_hash
    else
      begin
        url = ENV['meal_details_url'] + params[:id]
        result = Net::HTTP.get(URI.parse(url))
        recipe = JSON.parse(result)
        @recipe = recipe['meals'][0]
      rescue
        @error = 'Sorry: Meal Server Down. Please Come Back Later!'
      end
    end



    render partial: 'show_recipe'
  end

  def show_details
    m = Meal.find(params[:id])
    meal = JSON.parse(m.recipe)
    @recipe = meal
    render partial: 'show_recipe'
  end
end
