class UserProfilesController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update]
  before_action :find_user_and_profile

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  protected

  def find_user_and_profile
    @profile = current_user.profile || current_user.create_profile
  end

  def profile_params
    params.require(:profile).permit(:name, :birthday)
  end

end
