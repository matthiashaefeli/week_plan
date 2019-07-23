class LikesController < ApplicationController
  before_action :loged_in
  def create
    like = Like.find_by(user_id: current_user.id, meal_string: params[:id])
    if like
      meal = Meal.find(like.meal_id)
      meal.destroy
      like.destroy
    else
      url = ENV['MEAL_DETAILS_URL'] + params[:id]
      recipe = Net::HTTP.get(URI.parse(url))
      meal_hash = JSON.parse(recipe)
      name = meal_hash['meals'][0]['strMeal']
      img_url = meal_hash['meals'][0]['strMealThumb']
      meal_id_string = meal_hash['meals'][0]['idMeal']
      meal = Meal.create(recipe: recipe, user_id: current_user.id, name: name, img_url: img_url, meal_id_string: meal_id_string)
      meal.save
      like = Like.create(meal_string: params[:id], user_id: current_user.id, meal_id: meal.id)
      like.save
    end
    respond_to do |format|
      format.json { render json: { notice: 'saved' } }
    end
  end

  def update
    like = Like.find_by(meal_string: params[:id])
    like.week_plan = like.week_plan == false ? true : false
    like.save
    respond_to do |format|
      format.json { render json: { notice: like.week_plan } }
    end
  end
end
