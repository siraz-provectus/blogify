class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  belongs_to :post, counter_cache: true

  validates :user, :post, presence: true

  validates :body,
            presence: true,
            length: { maximum: 1000 }
end