class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @posts = Post.recent
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to posts_path, notice: "已成功新增！"
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.user = current_user
    if @post.update(post_params)
      redirect_to posts_path
      flash[:warning] = "已完成編輯！"
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to posts_path, alert: "已刪除此留言！"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

end
