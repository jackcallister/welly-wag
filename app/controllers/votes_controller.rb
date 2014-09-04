class VotesController < ApplicationController
  before_action :authenticate_user!
  before_filter :load_voteable

  def create
    @voteable.votes.build(user: current_user).save
    redirect_to :back
  end

  private

  def load_voteable
    resource, id = request.path.split('/')[1, 2]
    @voteable = resource.singularize.classify.constantize.friendly.find(id)
  end
end
