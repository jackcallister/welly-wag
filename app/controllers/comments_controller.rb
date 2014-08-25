class CommentsController < ApplicationController
  before_action :authenticate_user!

  def show
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new( {user: current_user}.merge comment_params )

    if @comment.save
      redirect_to post_path(comment_params[:post_id]), notice: "Comment created successfully"
    else
      redirect_to post_path(comment_params[:post_id]), notice: "Something went wrong, please try again."
    end
  end

  private

  def comment_params
    params[:comment].permit(
      :content,
      :post_id,
      :comment_id
    )
  end
end
