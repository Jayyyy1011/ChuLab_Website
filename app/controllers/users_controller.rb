class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to users_path, alert: "已刪除此帳號！"
  end
end
