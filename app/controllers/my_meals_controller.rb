class MyMealsController < ApplicationController
  def index
    @my_meals = MyMeal.all
  end

  def new
    @my_meal = MyMeal.new
  end

  def create
    @my_meal = MyMeal.new(my_meal_params)

    if @my_meal.avatar.attached?
      @my_meal.mealThumb = url_for(@my_meal.avatar)
    end

    if @my_meal.save
      params[:ingredients].each do |i|
        if i[:ingredient][:foods] != '' && i[:ingredient][:measures] != '' && i[:ingredient][:qty] != ''
          food = Food.find_by_name(i[:ingredient][:foods])
          measure = Measure.find_by_name(i[:ingredient][:measures])
          description = i[:ingredient][:description]
          qty = i[:ingredient][:qty]
          ingredient = Ingredient.create(food_id: food.id,
                                        measure_id: measure.id,
                                        my_meal_id: @my_meal.id,
                                        qty: qty,
                                        description: description)
          if !ingredient.save
            render :new, locals: { notice: ingredient.errors.full_messages } and return
          end
        else
          # check how to handle the error
        end
      end
        redirect_to my_meals_path
    else
      render :new, locals: { notice: @my_meal.errors.full_messages }
    end
  end

  def update
    my_meal = MyMeal.find(params[:id])
    my_meal.update_attributes(my_meal_params)
    if my_meal.avatar.attached?
      my_meal.mealThumb = url_for(my_meal.avatar)
    end
    if my_meal.save
      params[:ingredients].each do |i|
        if i[:ingredient][:foods] != '' && i[:ingredient][:measures] != '' && i[:ingredient][:qty] != ''
          food = Food.find_by_name(i[:ingredient][:foods])
          measure = Measure.find_by_name(i[:ingredient][:measures])
          description = i[:ingredient][:description]
          qty = i[:ingredient][:qty]
          ingredient = Ingredient.create(food_id: food.id,
                                        measure_id: measure.id,
                                        my_meal_id: my_meal.id,
                                        qty: qty,
                                        description: description)
          ingredient.save
        else
          # check how to handle the error
        end
      end
      redirect_to my_meals_path
    else
      render :edit, locals: { notice: my_meal.errors.full_messages }
    end
  end

  def edit
    @my_meal = MyMeal.find(params[:id])
    @foods = Food.all
    @measures = Measure.all
  end

  def show
    @my_meal = MyMeal.find(params[:id])
    render layout: false
  end

  def destroy
    my_meal = MyMeal.find(params[:id])
    respond_to do |format|
      if my_meal.weeks.length > 0
        format.json { render json: { notice: "You can't delete this meal because its used in a week program" } }
      else
        my_meal.destroy
        format.json { render json: { notice: 'ok' } }
      end
    end
  end

  private

  def my_meal_params
    params.require(:my_meal).permit(:title, :avatar, :category, :instructions)
  end
end
