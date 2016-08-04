class UsersController < ApplicationController

  before_action :already_logged_in, except: [:show]
  before_action :authenticate, only: [:show]

  def new
  end

  def show
  end

  def create
    user = User.new(user_params)
    if user.save
      login(user)
    else
      flash.now[:errors] = user.errors.full_messages
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
