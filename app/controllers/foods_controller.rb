class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
    render layout: false
  end

  def create
    @food = Food.create(name: params[:name].gsub(' ', '_'))
    respond_to do |format|
      if @food.save
        format.json { render json: { notice: 'saved' } }
      else
        format.json { render json: { notice: @food.errors.full_messages } }
      end
    end
  end
end
