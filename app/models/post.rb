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
  validates :url, format: URI::regexp(%w(http https)), unless: 'description.present?'

  validates :url, presence: true, :if => Proc.new { |p| p.description.blank? }
  validates :description, presence: true, :if => Proc.new { |p| p.url.blank? }

  validates :url, length: { is: 0, message: 'must be blank' }, unless: 'description.blank?'
  validates :description, length: { is: 0, message: 'must be blank' }, unless: 'url.blank?'

  scope :ranked, -> { all.sort_by(&:ranking).reverse }

  def display_url
    URI(url).host if url
  end

  def display_url_with_brackets
    "(" + display_url + ")" if url
  end
end

