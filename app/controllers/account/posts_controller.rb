class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_params, only: [:edit, :update, :destroy]

  def index
  	@posts = current_user.posts.paginate(:page => params[:page], :per_page => 4)
  end

  def edit
    if @post.user != current_user
      flash[:warning] = "您不是該筆記的作者！"
      redirect_to posts_path
    end
  end

  def update

    if @post.update(account_post_params)
      redirect_to account_posts_path
      flash[:warning] = "已完成編輯！"
    else
      render :edit
    end
  end

  def destroy
    @post.delete
    redirect_to account_posts_path
  end

  private

  def account_post_params
    params.require(:post).permit(:title, :content)
  end

  def find_params
    @post = Post.find(params[:id])
  end

end
