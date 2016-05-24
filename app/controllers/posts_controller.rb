class PostsController < ApplicationController
  before_filter :authenticate_user!, only: [:new, :create, :destroy]
  def index
    @posts = Post.all.reverse
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path
    else
      flash[:notice] = "A post need a title and a message under 5 and 10000 characters"
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    if post.user == current_user
      post.delete
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :message)
  end
end
