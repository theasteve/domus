class SessionController < ApplicationController
  #skip_before_action :authorized

  def create
    user = PropertyOwner.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to properties_path
    else
      redirect_to root_path,  notice: "Invalid email or password"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path, status: :see_other, notice: 'Logged out!'
  end
end
