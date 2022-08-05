class SessionController < ApplicationController
  #skip_before_action :authorized

  def create
    user = PropertyOwner.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to properties_path
    else
      flash.now.alert = "Credentials are invalid"
      redirect_to properties_path
    end

    def destroy
      session.delete(:user_id)
      redirect_to properties_path, notice: 'Logged out!'
    end

  end
end