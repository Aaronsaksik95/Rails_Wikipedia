class AddUserToHistorical < ActiveRecord::Migration[6.0]
  def change
    add_reference :historicals, :user, foreign_key: true
  end
end
