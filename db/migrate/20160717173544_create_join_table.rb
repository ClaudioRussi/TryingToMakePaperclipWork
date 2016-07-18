class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :memes, :users do |t|
      # t.index [:meme_id, :user_id]
      # t.index [:user_id, :meme_id]
    end
  end
end
