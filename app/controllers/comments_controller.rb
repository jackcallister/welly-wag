class CommentsController < ApplicationController
  include Clearable
  before_action :authenticate_user!
  clear_notifications :comment, :show

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
      :parent_type,
      :parent_id,
      :post_id
    )
  end
end
