class Post < ActiveRecord::Base
  include Voteable
  include Rankable

  paginates_per 10

  belongs_to :user
  has_many :comments

  validates :title, presence: true

  validates :url, presence: true, :if => Proc.new { |p| p.description.blank? }
  validates :description, presence: true, :if => Proc.new { |p| p.url.blank? }

  scope :ranked, -> { all.sort_by(&:ranking).reverse }

  def display_url
    URI(url).host if url
  end

  def display_url_with_brackets
    "(" + display_url + ")" if url
  end
end

