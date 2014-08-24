class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :votes

  validates :nickname, presence: true

  # Public: Check if the user can vote on the given
  # post.
  #
  # Return true if the user doesn't have any
  # exsiting votes for the post.
  #
  def can_vote?(post)
    votes.where(post: post).blank?
  end

  # Public: The avatar image url.
  #
  # Return either a gravatar image url or generated robot
  # url image via robothash.org
  #
  def avatar_url
    "http://robohash.org/#{email}?gravatar=yes"
  end
end
