class AddAttachmentBodyToMemes < ActiveRecord::Migration
  def self.up
    change_table :memes do |t|
      t.attachment :body
    end
  end

  def self.down
    remove_attachment :memes, :body
  end
end
