class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  has_many :votes
  has_many :notifications, foreign_key: 'recipient_id'

  validates :name, presence: true

  # Public: The avatar image url.
  #
  # Return either a gravatar image url or generated robot
  # url image via robothash.org
  #
  def avatar_url
    "http://robohash.org/#{email}?gravatar=yes"
  end

  def unsubscribe_digest!
    update_attribute(:send_digest, false)
  end

  def access_token
    self.verifier.generate(id)
  end

  def self.find_by_access_token(signature)
    byebug
    id = verifier.verify(signature)
    find(id)
  rescue ActiveSupport::MessageVerifier.InvalidSignature
    nil
  end

  def self.verifier
    ActiveSupport::MessageVerifier.new(Rails.application.secrets.secret_key_base)
  end
end
