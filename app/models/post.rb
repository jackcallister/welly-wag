class Post < ActiveRecord::Base
  extend FriendlyId

  include Voteable
  include Rankable
  include Markdownable

  NOTIFICATION_MESSAGE = "You have a new comment on your post."

  friendly_id :title, use: :slugged

  paginates_per 10

  belongs_to :user
  has_many :comments
  has_many :notifications, as: :notifiable

  validates :title, presence: true
  validates :url, url: { allow_blank: true }
  validates :url, presence: true, if: Proc.new { |p| p.description.blank? }

  scope :ranked, -> { all.sort_by(&:ranking).reverse }
end

