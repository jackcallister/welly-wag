class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :votes

  after_create :set_avatar_url

  def can_vote?(post)
    !votes.where(post: post).any?
  end

  private

  # Private: Set the avatar url to either the gravatar or an
  # asset image.
  #
  # Check that an avatar_url wasn't already set before
  # attempting anything.
  #
  def set_avatar_url
    hash = Digest::MD5.hexdigest(email)
    update_attributes(avatar_url: "http://robohash.org/#{hash}?gravatar=yes") unless avatar_url
  end
end
