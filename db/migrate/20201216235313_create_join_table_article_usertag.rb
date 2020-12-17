class CreateJoinTableArticleUsertag < ActiveRecord::Migration[6.0]
  def change
    create_join_table :articles, :usertags do |t|
      # t.index [:article_id, :usertag_id]
      # t.index [:usertag_id, :article_id]
    end
  end
end
