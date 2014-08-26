require 'active_support/concern'

# Rankable: Provide a scope which sorts by a ranking alorithm.
#
module Rankable
  extend ActiveSupport::Concern

  included do
    scope :ranked, -> { all.sort_by(&:ranking).reverse }

    def ranking
      points / (age + 2) ** 1.8
    end

    private

    def points
      votes.count.to_f + comments.select(:user_id).distinct.count.to_f
    end

    def age
      Time.now - created_at
    end
  end
end
