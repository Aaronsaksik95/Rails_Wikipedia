class AddDisplayOrNotToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :display_or_not, :timestamp
  end
end
