class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.integer :meal_id
      t.string :meal_string

      t.timestamps
    end
  end
end
