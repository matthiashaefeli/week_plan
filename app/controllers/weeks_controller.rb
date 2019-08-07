class WeeksController < ApplicationController
  before_action :loged_in
  def index
    @weeks = Week.where(user_id: current_user.id)
  end

  def new
  end

  def create
    @week = Week.new(user_id: current_user.id)
    counter = 0
    params[:ids].each do |id|
      @week.my_meals << MyMeal.find(id)
      @week.days << params[:weekdays][counter]
      counter += 1
    end
    ingredients_hash = {}
    @week.my_meals.each do |m|
      m.ingredients.each do |i|
        if ingredients_hash.key?(i.food.name) &&  ingredients_hash[i.food.name].key?(i.measure.name)
          ingredients_hash[i.food.name][i.measure.name] += i.qty
        elsif ingredients_hash.key?(i.food.name)
          ingredients_hash[i.food.name][i.measure.name] = i.qty
        else
          ingredients_hash[i.food.name] =  { i.measure.name => i.qty }
        end
      end
    end
    @week.grocery = ingredients_hash
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
