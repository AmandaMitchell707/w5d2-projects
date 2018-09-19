class Comment < ApplicationRecord
  validates :content, :author_id, :post_id, presence: true
  
  belongs_to :author,
    foreign_key: :author_id,
    class_name: :User
    
  belongs_to :post
      
end
