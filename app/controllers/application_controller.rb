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
    redirect_to user
  end

  def already_logged_in
    redirect_to root_url if current_user
  end

  def authenticate
    redirect_to new_session_url unless current_user
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
