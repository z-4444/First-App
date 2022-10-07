class ChangeScoreToFloat < ActiveRecord::Migration[6.1]
  def change
    change_column :comments, :score, :float
  end
end
