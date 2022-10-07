class ChengeAvatar < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :avatar, :profile_pic
  end
end
