class Invite < ActiveRecord::Base
  COUNT = 2

  belongs_to :user

  scope :available, -> { where(expired: false) }

  def self.generate
    code = (Faker::Hacker.verb + Faker::Hacker.noun).gsub(' ', '')
    Invite.create(code: code)
  end
end
