class Account::CollectsController < ApplicationController
  before_action :authenticate_user!

  def index
    @posts = current_user.collected_posts.paginate(:page => params[:page], :per_page => 4)
  end

  def cancel
    @post = Post.find(params[:id])
    if current_user.is_fan_of?(@post)
      current_user.collected_posts.delete(@post)
    end
  end

end
