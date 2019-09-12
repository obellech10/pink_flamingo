class ApplicationController < ActionController::Base
  helper_method :current_user, :boolean_to_words

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def boolean_to_words(value)
    value ? "Yes" : "No"
  end
end
