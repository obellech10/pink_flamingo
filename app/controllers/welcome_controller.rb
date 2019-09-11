class WelcomeController < ApplicationController
  layout 'welcome', only: [:index]

  def index
  end
end
