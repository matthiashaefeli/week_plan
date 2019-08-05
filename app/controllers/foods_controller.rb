class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.create(food_params)
    if @food.save
      redirect_to foods_path
    end
  end

  private

  def food_params
    params.require(:food).permit(:name)
  end
end
