class UsersController < ApplicationController
  def index
    @users = User.recent.paginate(:page => params[:page], :per_page => 10)
  end
end
