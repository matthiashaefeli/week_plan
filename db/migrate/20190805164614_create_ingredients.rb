class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.integer :measure_id
      t.integer :my_meal_id
      t.integer :food_id
      t.string :qty
      t.string :description


      t.timestamps
    end
  end
end
