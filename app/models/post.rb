class Post < ActiveRecord::Base
	acts_as_taggable
	
  belongs_to :category

  has_many :comments, dependent: :destroy

  validates :category, presence: true

  validates :title, 
            presence: true, 
            length: { in: 2..500 }

  validates :body,
            presence: true,
            length: { maximum: 5000 }
end