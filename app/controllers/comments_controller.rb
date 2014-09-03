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
      redirect_success
    else
      redirect_failure
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

  def redirect_success
    if comment_params[:parent_type] == 'Post'
      @post = Post.find(comment_params[:parent_id])
      redirect_to post_path(id: @post.friendly_id), notice: "Comment created successfully"
    else
      redirect_to comment_path(comment_params[:parent_id]), notice: "Comment created successfully"
    end
  end

  def redirect_failure
    if comment_params[:parent_type] == 'Post'
      redirect_to post_path(comment_params[:parent_id]), notice: "Something went wrong, please try again."
    else
      redirect_to comment_path(comment_params[:parent_id]), notice: "Something went wrong, please try again."
    end
  end
end
