class PostsController < ApplicationController
  include Clearable
  before_action :authenticate_user!, except: [:index, :show]
  clear_notifications :post, :show

  def index
    @posts = Kaminari.paginate_array(Post.ranked).page(params[:page]).per(10)
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def destroy
    current_user.posts.find(params[:id]).delete
    redirect_to root_path
  end

  private

  def post_params
    params[:post].permit(
      :title,
      :url,
      :description
    )
  end
end
