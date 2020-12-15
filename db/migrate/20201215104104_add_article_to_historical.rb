class AddArticleToHistorical < ActiveRecord::Migration[6.0]
  def change
    add_reference :historicals, :article, null: false, foreign_key: true
  end
end
