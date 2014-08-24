class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :votes

  validates :nickname, presence: true

  # Public: The avatar image url.
  #
  # Return either a gravatar image url or generated robot
  # url image via robothash.org
  #
  def avatar_url
    "http://robohash.org/#{email}?gravatar=yes"
  end
end
