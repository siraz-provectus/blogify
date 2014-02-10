class Category < ActiveRecord::Base
	has_ancestry

	has_many :posts, dependent: :destroy
  has_many :comments, through: :posts

  validates :title, 
            presence: true, 
            length: { in: 2..100 }
end