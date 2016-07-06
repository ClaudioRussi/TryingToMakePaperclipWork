class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :category
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.text :body
      t.integer :votes

      t.timestamps null: false
    end
  end
end
