class CreateMemes < ActiveRecord::Migration
  def change
    create_table :memes do |t|
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.references :moderator, index: true, foreign_key: true
      t.integer :vote_count
      t.integer :vote

      t.timestamps null: false
    end
  end
end
