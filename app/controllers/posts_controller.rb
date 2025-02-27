class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @posts = Post.all.includes(:user)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user 
    if @post.save
      redirect_to posts_path, notice: '投稿が作成されました。'
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user) 
  end

  private

  def post_params
    params.require(:post).permit(:name, :title, :content, :image)
  end
end
end
