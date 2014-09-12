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
    klass = resource.singularize.classify.constantize
    @voteable = klass.respond_to?(:friendly) ? klass.friendly.find(id) : klass.find(id)
  end
end
