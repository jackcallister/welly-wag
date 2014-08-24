class VotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @post.votes.build(user: current_user).save
    redirect_to :back
  end

  private

  def set_post
    @post = Post.find(params[:vote][:post_id])
  end
end
