class AddMemeIdColumnToComments < ActiveRecord::Migration
  def change
  	change_table :comments do |t|
  		t.references :meme, index:true, foreign_key:true
  	end
  end
end
