class Post < ActiveRecord::Base
  paginates_per 10
  belongs_to :user
  has_many :votes
  has_many :comments

  validates :title, presence: true

  scope :ranked, -> { all.sort_by(&:ranking).reverse }

  def display_url
    URI(url).host if url
  end

  def display_url_with_brackets
    "(" + display_url + ")" if url
  end

  def ranking
    votes.count.to_f + 1 / ((Time.now - created_at) ** 1.5).to_f
  end

  def top_level_comments
    comments.where(comment_id: nil)
  end
end

