class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :info, :boolean, default: true
  end
end
