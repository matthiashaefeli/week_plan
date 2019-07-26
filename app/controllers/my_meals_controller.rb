class MyMealsController < ApplicationController
  def new
    @my_meal = MyMeal.new
  end

  def create
    binding.pry
  end

  def destroy
  end
end
