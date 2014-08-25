class Comment < ActiveRecord::Base
  include Voteable
  include Rankable

  belongs_to :post
  belongs_to :user
  belongs_to :comment
  has_many   :comments
  belongs_to :parent, polymorphic: true

  validates :content, presence: true

  scope :ranked, -> { all.sort_by(&:ranking).reverse }
  scope :root, -> { where(comment_id: nil) }
end
