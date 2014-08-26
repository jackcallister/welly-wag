class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :votes
  has_many :invites

  validates :nickname, presence: true
  validates :code,     presence: true

  before_validation :validate_code
  after_create      :generate_invites

  # Public: The avatar image url.
  #
  # Return either a gravatar image url or generated robot
  # url image via robothash.org
  #
  def avatar_url
    "http://robohash.org/#{email}?gravatar=yes"
  end

  private

  def validate_code
    invite = Invite.where(code: code, expired: false).first

    if !invite
      errors.add :invite_code, "is invalid, ask around on twitter for one."
    else
      invite.expired = true
      invite.save
    end
  end

  def generate_invites
    Invite::COUNT.times do
      invite = Invite.generate
      invite.user = self
      invite.save
    end
  end
end
