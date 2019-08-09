module MyMealsHelper
  def like(id)
    my_meal = MyMeal.find(id)
    user_array = my_meal.likes.map { |l| l.user }
    user_array.include?(current_user)
  end
end
