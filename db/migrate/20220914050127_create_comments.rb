class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :article, null: false, foreign_key: true
      if table_exists?("users")
        t.references :user, null: false, foreign_key: true
      end
      t.timestamps
    end
  end
end
