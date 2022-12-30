class SessionsController < ApplicationController
  skip_before_action :authorize

  def create
    user = PropertyOwner.find_by(email: params[:email])
    
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to properties_path, status: :see_other
    else
      redirect_to sessions_new_path,  notice: "Invalid email or password"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to sessions_new_path, status: :see_other, notice: 'Logged out!'
  end
end
