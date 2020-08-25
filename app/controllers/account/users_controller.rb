class Account::UsersController < ApplicationController

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      redirect_to edit_account_user_path(@user), notice: "更新成功！"
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:name, :birthday)
  end
end
