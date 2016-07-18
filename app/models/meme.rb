class Meme < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :moderators, class_name: 'User'
  has_many :comments
  has_attached_file :body, styles: { large: "1000x",medium:"600x",small: "200x200>"}, default_url: "/images/:style/missing.png"
  
  validates_attachment_content_type :body, content_type: /\Aimage\/.*\Z/
  validates :title, presence:true, length:{maximum:25}
  validates :body, attachment_presence:true
  
  before_save :accepted?
  
  
  private
    def accepted?
      if self.status == 'In Moderation' and self.vote_count >= 1 and self.vote.to_f/self.vote_count >= 0.5
        self.status='Accepted'
      end
    end
end
