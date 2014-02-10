class Post < ActiveRecord::Base

  paginates_per 10

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


  scope :by_category_id, -> (category_id) {
    where(category_id: category_id)
  }
  scope :by_tag_list, -> (tag_list) {
    tagged_with(tag_list.split(','), on: :tags, any: true)
  }
  scope :by_full_text, -> (full_text) {
    where("lower(title) LIKE ? OR lower(body) LIKE ?", 
      "%#{full_text.mb_chars.downcase}%", "%#{full_text.mb_chars.downcase}%")
  }
  scope :after, -> (start_date) {
    where("created_at >= ?", start_date)
  }
  scope :before, -> (end_date) {
    where("created_at <= ?", end_date)
  }  
end