class LikesController < ApplicationController
  before_action :loged_in
  def create
    like = Like.find_by(user_id: current_user.id, meal_string: params[:id])
    if like
      meal = Meal.find(like.meal_id)
      if meal.week != []
        notice = "This Meal is included in a week and you need the recipe!"
      else
        notice = 'saved'
        meal.destroy
        like.destroy
      end

    else
      if params[:local]
        my_meal = MyMeal.find(params[:id])
        meal = Meal.create(recipe: my_meal.to_hash.to_json, user_id: current_user.id, name: my_meal.strMeal, img_url: my_meal.strMealThumb, meal_id_string: my_meal.idMeal.to_s)
        meal.save
      else
        url = ENV['meal_details_url'] + params[:id]
        response = Net::HTTP.get(URI.parse(url))
        meal_hash = JSON.parse(response)
        recipe = meal_hash['meals'][0].to_json
        name = meal_hash['meals'][0]['strMeal']
        img_url = meal_hash['meals'][0]['strMealThumb']
        meal_id_string = meal_hash['meals'][0]['idMeal']
        meal = Meal.create(recipe: recipe, user_id: current_user.id, name: name, img_url: img_url, meal_id_string: meal_id_string)
        meal.save
      end
      like = Like.create(meal_string: params[:id], user_id: current_user.id, meal_id: meal.id)
      like.save
      notice = 'saved'
    end
    respond_to do |format|
      format.json { render json: { notice: notice } }
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
