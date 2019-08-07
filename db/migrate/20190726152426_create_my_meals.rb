class CreateMyMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :my_meals, :primary_key => :idMeal do |t|
      t.string :title
      t.string :category
      t.string :instructions
      t.string :mealThumb, default: ''

      t.timestamps
    end
  end
end
