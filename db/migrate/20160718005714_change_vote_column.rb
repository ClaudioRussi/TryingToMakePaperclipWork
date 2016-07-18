class ChangeVoteColumn < ActiveRecord::Migration
  def change
    change_table :memes do |t|
      t.change :vote, :integer, default: 0
      t.change :vote_count, :integer, default: 0
    end
  end
end
