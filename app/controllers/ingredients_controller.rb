class IngredientsController < ApplicationController
  def destroy
    i = Ingredient.find(params[:id])
    i.delete
    respond_to do |format|
      format.json { render json: { notice: 'ok' } }
    end
  end
end
