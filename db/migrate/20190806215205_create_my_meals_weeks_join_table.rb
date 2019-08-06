class CreateMyMealsWeeksJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :weeks, :my_meals
  end
end
