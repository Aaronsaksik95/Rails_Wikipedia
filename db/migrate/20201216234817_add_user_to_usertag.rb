class AddUserToUsertag < ActiveRecord::Migration[6.0]
  def change
    add_reference :usertags, :user, null: false, foreign_key: true
  end
end
