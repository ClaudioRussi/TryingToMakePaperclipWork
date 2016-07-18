class AddStatusColumnToMeme < ActiveRecord::Migration
  def change
    add_column :memes, :status, :string, default:'In Moderation'
  end
end
