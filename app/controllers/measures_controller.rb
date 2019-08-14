class MeasuresController < ApplicationController
  def index
    @measures = Measure.all
  end

  def new
    @measure = Measure.new
    render layout: false
  end

  def create
    @measure = Measure.create(name: params[:name].gsub(' ', '_'))
    respond_to do |format|
      if @measure.save
        format.json { render json: { notice: 'saved' } }
      else
        format.json { render json: { notice: @measure.errors.full_messages } }
      end
    end
  end
end
