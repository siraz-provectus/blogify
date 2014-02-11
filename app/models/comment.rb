class Comment < ActiveRecord::Base

  paginates_per 30

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

  default_scope { order('created_at DESC') }
            
  scope :not_declined, -> {
    where.not(status: 'declined').includes(:user)
  }

  scope :pending, -> {
    where(status: 'pending')
  }
end