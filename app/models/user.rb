class User < ActiveRecord::Base
  has_secure_password
  validates :email, presence:true, uniqueness: true, length:{minimum:9,maximum:200}
  validates :name, presence:true, length:{maximum:15}
  has_many :posts
  has_many :comments
end
