class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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
      redirect_to root_path, notice: "Post created successfully"
    else
      render :new
    end
  end

  def destroy
    current_user.posts.find(params[:id]).delete
    redirect_to root_path, notice: "Post created successfully"
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
