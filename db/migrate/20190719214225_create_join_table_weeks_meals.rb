class CreateJoinTableWeeksMeals < ActiveRecord::Migration[5.2]
  def change
    create_join_table :weeks, :meals do |t|
      t.index [:week_id, :meal_id]
      t.index [:meal_id, :week_id]
    end
  end
end
