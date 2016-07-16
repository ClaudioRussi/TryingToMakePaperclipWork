class Post < ActiveRecord::Base
  has_attached_file :cover, styles:{cover:'1000x400!'},default_url: "/images/:style/missing_cover.png"
  belongs_to :user
  has_many :comments
  
  validates :body, presence:true,length:{minimum:50}
  validates :title, presence:true, length:{minimum:5, maximum:25}
  validates :category, presence:true, inclusion: {in:["Adoption","Found","Missing"]}
  validates_attachment_content_type :cover, content_type: /\Aimage/
  validates_attachment_file_name :cover, matches: [/png\Z/, /jpe?g\Z/]
  
  scope :order_by_category, -> (category) { where(category: category) }
end
