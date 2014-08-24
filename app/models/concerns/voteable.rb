require 'active_support/concern'

module Voteable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :voteable

    # Public: Check if the user can vote for the resource.
    #
    # Return true if the user doesn't have any
    # exsiting votes for the resource.
    #
    def voteable?(user)
      Vote.where(voteable_id: self.id, voteable_type: self.class.to_s, user: user).blank?
    end
  end
end
