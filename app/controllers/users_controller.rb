class UsersController < ApplicationController

  before_action :already_logged_in, except: [:show, :activate, :resend, :destroy]
  # before_action :authenticate, only: [:destroy]

  def new
  end

  def show
    redirect_to new_session_url unless current_user
  end

  def create
    user = User.new(user_params)
    if user.save
      UserMailer.activation_email(user).deliver
      login(user)
      redirect_to user_url
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  def activate
    user = User.find_by(activation_token: params[:activation_token])
    user.activated = true
    if user.save
      login(user)
      redirect_to bands_url
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_session_url
    end
  end

  def resend
    user = User.find(params[:id])
    UserMailer.activation_email(user).deliver
    flash[:info] = ["Activation Email Sent!"]
    redirect_to user_url
  end

  def destroy
    return redirect_to new_session_url unless current_user
    if current_user.destroy
      flash[:info] = ["User successfully destroyed"]
      redirect_to new_session_url
    else
      flash[:errors] = user.errors.full_messages
      redirect_to user
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
