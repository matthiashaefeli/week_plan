class MeasuresController < ApplicationController
  def index
    @measures = Measure.all
  end

  def new
    @measure = Measure.new
  end

  def create
    @measure = Measure.create(name: params[:measure][:name].gsub(' ', '_'))
    if @measure.save
      redirect_to measures_path
    end
  end
end
