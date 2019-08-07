class MeasuresController < ApplicationController
  def index
    @measures = Measure.all
  end

  def new
    @measure = Measure.new
  end

  def create
    @measure = Measure.create(measure_params)
    if @measure.save
      redirect_to measures_path
    end
  end

  private

  def measure_params
    params.require(:measure).permit(:name)
  end
end
