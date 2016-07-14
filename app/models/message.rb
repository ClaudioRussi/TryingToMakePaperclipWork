class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User'
  belongs_to :recipent, class_name: 'User'
  validates :body, presence:true
  validates :recipent, presence:true
  validates :sender, presence:true
end
