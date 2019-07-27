class MyMealsController < ApplicationController
  def index
    @my_meals = MyMeal.all
  end

  def new
    @my_meal = MyMeal.new
  end

  def create
    @my_meal = MyMeal.new(my_meal_params)
    if @my_meal.save
      redirect_to my_meals_path
    else
      render :new, locals: { notice: @my_meal.errors.full_messages }
    end
  end

  def destroy
    my_meal = MyMeal.find(params[:id])
    my_meal.destroy
    respond_to do |format|
      format.json { render json: { notice: 'ok' } }
    end
  end

  private

  def my_meal_params
    params.require(:my_meal).permit!
  end
end