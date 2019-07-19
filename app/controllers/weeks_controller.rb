class WeeksController < ApplicationController
  def index
    @weeks = Week.where(user_id: current_user.id)
  end

  def create
    week = Week.new(user_id: current_user.id)
    params[:ids].each do |id|
      week.meals << Meal.find(id)
    end
    week.save
    respond_to do |format|
      format.json { render json: { notice: 'saved' } }
    end
  end
end
