class WeeksController < ApplicationController
  before_action :loged_in
  def index
    @weeks = Week.where(user_id: current_user.id)
  end

  def create
    @week = Week.new(user_id: current_user.id)
    counter = 0
    params[:ids].each do |id|
      @week.meals << Meal.find(id)
      @week.days << params[:weekdays][counter]
      counter += 1
    end
    ingredients = {}
    @week.meals.each do |m|
      meal = JSON.parse(m.recipe)['meals'][0]
      index = 1
      loop do
        i = 'strIngredient' + index.to_s
        m = 'strMeasure' + index.to_s
        if meal[i] == ''
          break
        end
        meal_value = meal[m].gsub(/[^0-9]/, '').to_i
        meal_measure = meal[m].gsub(/[^A-Za-z]/, '')
        if ingredients[meal[i]] && ingredients[meal[i]][1] == meal_measure
          ingredients[meal[i]][0] += meal_value
        else
          ingredients[meal[i]] = [meal_value, meal_measure]
        end
        index += 1
      end
    end
    @week.grocery = ingredients
    @week.save
    render 'week_response', layout: false
  end

  def show
    @week = Week.find(params[:id])
    render 'grocery', layout: false
  end

  def destroy
    Week.find(params[:id]).destroy
    respond_to do |format|
      format.json { render json: { notice: 'saved' } }
    end
  end
end
