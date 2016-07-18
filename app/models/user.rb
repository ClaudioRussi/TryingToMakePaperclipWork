class User < ActiveRecord::Base
  has_secure_password
  has_attached_file :avatar, styles: {medium: "300x300>", small: "100x100>",thumb: "60x60>"}, default_url: "/images/:style/missing.png"
  validates :email, presence:true, uniqueness: true, length:{minimum:9,maximum:200}
  validates :name, presence:true, length:{maximum:15}
  has_many :posts
  has_many :comments
  has_many :sent_messages, class_name: 'Message'
  has_many :received_messages, class_name: 'Message'
  has_many :memes
  has_and_belongs_to_many :moderated_memes, class_name: 'Meme'
  validates_attachment_content_type :avatar, content_type: /\Aimage/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /jpe?g\Z/]
end
