class MyMealsController < ApplicationController
  def index
    @my_meals = MyMeal.all
  end

  def new
    @my_meal = MyMeal.new
    @foods = Food.all
    @measures = Measure.all
  end

  def create
    my_meal = MyMeal.create(title: params[:title],
                             category: params[:category],
                             instructions: params[:instructions])
    if my_meal.avatar.attached?
      my_meal.strMealThumb = url_for(@my_meal.avatar)
    end

    if my_meal.save
      params[:ingredients].each do |i|
        food = Food.find_by_name(i[:ingredient][:foods])
        measure = Measure.find_by_name(i[:ingredient][:measures])
        qty = i[:ingredient][:qty]
        ingredient = Ingredient.create(food_id: food.id,
                                       meausure_id: measure.id,
                                       my_meal_id: my_meal.id,
                                       qty: qty)
        ingredient.save
      end
    end

    binding.pry


    # if @my_meal.avatar.attached?
    #   @my_meal.strMealThumb = url_for(@my_meal.avatar)
    # end
    # if @my_meal.save
    #   redirect_to my_meals_path
    # else
    #   render :new, locals: { notice: @my_meal.errors.full_messages }
    # end
  end

  def update
    my_meal = MyMeal.find(params[:id])
    my_meal.update_attributes(my_meal_params)
    if my_meal.avatar.attached?
      my_meal.strMealThumb = url_for(my_meal.avatar)
    end
    if my_meal.save
      redirect_to my_meals_path
    else
      render :edit, locals: { notice: my_meal.errors.full_messages }
    end
  end

  def edit
    @my_meal = MyMeal.find(params[:id])
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
