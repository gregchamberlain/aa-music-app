class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def logged_in?
    @current_user ? true : false
  end

  def login(user)
    session[:session_token] = user.session_token
  end

  def already_logged_in
    redirect_to root_url if current_user
  end

  def authenticate
    if current_user
      unless current_user.activated
        flash[:errors] = ["You must activate your accout before visiting that page!"]
        redirect_to user_url
      end
    else
      redirect_to new_session_url
    end
  end

  private
  def save(object)
    if object.save
      redirect_to object
    else
      flash.now[:errors] = object.errors.full_messages
      render :new
    end
  end
end
