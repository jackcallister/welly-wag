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
    points / (age + 2) ** 1.8
  end

  def points
    votes.count.to_f + comments.select(:user_id).distinct.count.to_f
  end

  def age
    Time.now - created_at
  end

  def top_level_comments
    comments.where(comment_id: nil)
  end
end

