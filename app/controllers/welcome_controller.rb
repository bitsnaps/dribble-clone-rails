class WelcomeController < ApplicationController

  def index
    # flash[:success] = 'it works!'
  end

  def about
    # redirect_to root_path, notice: 'Redirected from about page' # success
    # redirect_to root_path, alert: 'Redirected from about page' # alert
  end

end
