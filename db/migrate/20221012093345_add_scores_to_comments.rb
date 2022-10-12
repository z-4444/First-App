class AddScoresToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :score, :float
  end
end
