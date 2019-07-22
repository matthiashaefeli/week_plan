class CreateMeals < ActiveRecord::Migration[5.2]
  def change
    create_table :meals do |t|
      t.text :recipe
      t.integer :user_id
      t.string :name
      t.string :img_url
      t.string :meal_id_string

      t.timestamps
    end
  end
end
