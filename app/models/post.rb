class Post < ActiveRecord::Base
  include Voteable
  include Rankable

  NOTIFICATION_MESSAGE = "You have a new comment on your post."

  paginates_per 10

  belongs_to :user
  has_many :comments
  has_many :notifications, as: :notifiable

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

