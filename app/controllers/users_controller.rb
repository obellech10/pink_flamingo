class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def show
  end

  def update
    user = current_user
    if user.update(user_params)
      flash[:success] = "Welcome to your profile, #{user.name}!"
      redirect_to profile_path
    else
      flash[:error] = "Oh no! Something went wrong. Please try again."
      redirect_to profile_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :address, :city, :state, :zip, :phone, :email)
    end
end
