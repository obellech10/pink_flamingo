class SessionsController < ApplicationController
  def new;end

  def create
    auth = request.env["omniauth.auth"]
    user = User.create_with_omniauth(auth)
    session[:user_id] = user.id
    current_user.add_credential(auth[:provider], auth)

    redirect_to profile_path
    flash[:success] = "Successfully logged in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
