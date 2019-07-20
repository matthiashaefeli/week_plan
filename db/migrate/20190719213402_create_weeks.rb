class CreateWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :weeks do |t|
      t.integer :user_id
      t.text :days, array: true, default: []

      t.timestamps
    end
  end
end
