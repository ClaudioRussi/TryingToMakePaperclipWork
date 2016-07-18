class RemoveModeratorsColumnFromMeme < ActiveRecord::Migration
  def change
    remove_column :memes, :moderator_id
  end
end
