class Account::PostsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@posts = current_user.posts.paginate(:page => params[:page], :per_page => 4)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.delete
    redirect_to account_posts_path
  end

end
