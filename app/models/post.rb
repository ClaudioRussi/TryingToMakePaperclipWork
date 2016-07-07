class Post < ActiveRecord::Base
  belongs_to :user
  validates :body, presence:true,length:{minimum:50}
  validates :title, presence:true, length:{minimum:5, maximum:25}
  validates :category, presence:true, inclusion: {in:["Adoption","Found","Missing"]}
end
