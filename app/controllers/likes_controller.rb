class LikesController < ApplicationController
  def create
    like = Like.find_by(user_id: current_user.id, meal: params[:id])
    if like
      like.destroy
    else
      like = Like.create(user_id: current_user.id, meal: params[:id])
      like.save
    end
    respond_to do |format|
      format.json { render json: { notice: 'saved' } }
    end
  end
end
