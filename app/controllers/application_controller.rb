class ApplicationController < ActionController::Base
  before_action :authorize
  protect_from_forgery with: :exception
  helper_method :current_user

  private

  def current_user
    @current_user ||= PropertyOwner.find_by(id: session[:user_id])
  end

  def authorize 
    return if current_user

    redirect_to sessions_new_path 
  end
end
