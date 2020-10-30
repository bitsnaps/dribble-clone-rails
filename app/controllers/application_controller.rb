class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # If you want to use boostrap flash style (success, danger)
  # add_flash_types :success, :danger

end
