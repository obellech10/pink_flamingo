class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
  end

  def update
    user = current_user
    if user.update(user_params)
      flash[:success] = "Welcome to your profile, #{user.name}!"
      redirect_to profile_path
    else
      flash[:error] = "Oh no! Something went wrong..."
      redirect_to new_user_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :address, :city, :state, :zip, :phone, :email)
    end
end
