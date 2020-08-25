class PostsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_params, only: [:edit, :update, :destroy, :collect, :cancel]

  def index
    @posts = Post.recent.paginate(:page => params[:page], :per_page => 4)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to posts_path, notice: "已成功新增！"
    else
      render :new
    end
  end

  def edit

    if @post.user != current_user
      flash[:warning] = "您不是該筆記的作者！"
      redirect_to posts_path
    end
  end

  def update

    @post.user = current_user
    if @post.update(post_params)
      redirect_to posts_path
      flash[:warning] = "已完成編輯！"
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to posts_path, alert: "已刪除此筆記！"
  end

  def collect

    if !current_user.is_fan_of?(@post)
      current_user.collected_posts << @post
    end
    render "collect"
  end

  def cancel

    if current_user.is_fan_of?(@post)
      current_user.collected_posts.delete(@post)
    end
    render "collect"
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)
  end

  def find_params
    @post = Post.find(params[:id])
  end

end
