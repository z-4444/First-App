class AddCommentCounterToArticle < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :comment_counter, :integer
  end
end
