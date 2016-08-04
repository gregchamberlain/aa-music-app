class SessionsController < ApplicationController

  before_action :already_logged_in, except: [:destroy]

  def new

  end

  def create
    user = User.find_by(email: user_params[:email])
    if user && user.is_password?(user_params[:password])
      login(user)
    else
      flash.now[:errors] = ["Invalid Login credentials"]
      render :new
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
