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
    @week.save
    render 'week_response', layout: false
    # respond_to do |format|
      # format.json { render json: { notice: 'saved' } }
    # end
  end

  def destroy
    Week.find(params[:id]).destroy
    respond_to do |format|
      format.json { render json: { notice: 'saved' } }
    end
  end
end
