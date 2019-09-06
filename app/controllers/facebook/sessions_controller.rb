class Facebook::SessionsController < ApplicationController

  # def create
  #   auth = request.env["omniauth.auth"]
  #   user = User.create_with_omniauth(auth)
  #   session[:user_id] = user.id
  #   @credentials = Credential.find_or_create_by_omniauth(auth)
  #
  #   if signed_in?
  #     if @credentials.user == current_user
  #       redirect_to root_path
  #       flash[:error] = "You already linked that account!"
  #     else
  #       @credentials.user = current_user
  #       @credentials.save
  #       redirect_to profile_path
  #       flash[:success] = "Successfully linked to that account!"
  #     end
  #   else
  #     if @credentials.user.present?
  #       self.current_user = @credentials.user
  #       redirect_to profile_path
  #       flash[:success] = "Signed in!"
  #     else
  #       redirect_to login_path
  #       flash[:error] = "Please finish registering"
  #     end
  #   end
  # end
end
