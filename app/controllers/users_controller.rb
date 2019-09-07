class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    user = User.find_by(id: current_user.id)
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
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
