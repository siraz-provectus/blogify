class Comment < ActiveRecord::Base

	STATUSES = %w(pending approved declined)

  belongs_to :user
  belongs_to :post

  belongs_to :post, counter_cache: true

  validates :post, presence: true

  validates :body,
            presence: true,
            length: { maximum: 1000 }
            
  validates :status, 
            presence: true,
            inclusion: { in: STATUSES }
end