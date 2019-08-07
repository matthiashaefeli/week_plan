class LikesController < ApplicationController
  before_action :loged_in
  def create
    meal = MyMeal.find(params[:id])
    like = Like.find_by(user_id: current_user.id, my_meal_id: params[:id])
    if like
      notice = 'saved'
      like.destroy
    else
      like = Like.create(user_id: current_user.id, my_meal_id: meal.id)
      like.save
      notice = 'saved'
    end
    respond_to do |format|
      format.json { render json: { notice: notice } }
    end
  end

  def update
  #   like = Like.find_by(meal_string: params[:id])
  #   like.week_plan = like.week_plan == false ? true : false
  #   like.save
  #   respond_to do |format|
  #     format.json { render json: { notice: like.week_plan } }
  #   end
  end
end
