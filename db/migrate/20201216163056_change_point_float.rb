class ChangePointFloat < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :point, :float
  end
end
