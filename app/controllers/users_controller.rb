class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    binding.pry
    user = User.find_by(params["id"])
    render locals: {
      UserShowFacade.new(user)
    }
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome to your profile, #{user.first_name}!"
      redirect_to user_path(user.id)
    else
      flash[:error] = "Oh no! Something went wrong..."
      redirect_to new_user_path
    end
  end


  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :address, :city, :state, :zip, :phone, :email)
    end
end
