class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.create(name: params[:food][:name].gsub(' ', '_'))
    if @food.save
      redirect_to foods_path
    end
  end
end
