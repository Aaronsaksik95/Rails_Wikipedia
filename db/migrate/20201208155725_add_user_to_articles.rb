class AddUserToArticles < ActiveRecord::Migration[6.0]
  def change
    add_reference :articles, :user
  end
end
