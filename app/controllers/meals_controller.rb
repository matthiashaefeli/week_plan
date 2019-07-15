class MealsController < ApplicationController
  def index
    url = 'https://www.themealdb.com/api/json/v2/8673533/categories.php'
    result = Net::HTTP.get(URI.parse(url))
    categories = JSON.parse(result)
    @categories = categories['categories']
  end

  def category
    url = 'https://www.themealdb.com/api/json/v2/8673533/filter.php?c=' + params[:category]
    result = Net::HTTP.get(URI.parse(url))
    category = JSON.parse(result)
    @category = category['meals']
    render partial: 'category'
  end
end
