class ApplicationController < ActionController::Base
  before_action :authorized
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= PropertyOwner.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user
  end 

  def authorized   
    redirect_to property_owners_path unless logged_in?
 end
end
